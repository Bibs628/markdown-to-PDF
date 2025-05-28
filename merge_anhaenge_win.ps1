# merge_attachments_win.ps1
# Fügt Haupt-PDF + Anhänge zusammen (Windows-Version)
# Voraussetzung: pdflatex (z. B. über TeX Live), im PATH verfügbar

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$attachDir = Join-Path $projectDir "anhaenge-hinzufuegen"
$subDir    = Join-Path $attachDir "anhaenge"

# Haupt-PDF finden
$mainPDFs = Get-ChildItem -Path $attachDir -Filter *.pdf | Sort-Object Name
if ($mainPDFs.Count -eq 0) {
    Write-Host "❌ Keine Haupt-PDF in $attachDir gefunden."
    exit 1
}
$mainPDF = $mainPDFs[0].Name
$mainStem = [System.IO.Path]::GetFileNameWithoutExtension($mainPDF)
$outputPDF = "${mainStem}_anhaenge.pdf"

Write-Host "➤ Haupt-PDF        : $mainPDF"
Write-Host "➤ Anhang-Verzeichnis: $subDir"

# Anhänge finden
$attachments = Get-ChildItem -Path $subDir -Filter *.pdf | Sort-Object Name

# Temporäre LaTeX-Datei erstellen
$tempTex = Join-Path $attachDir "merge_temp.tex"
@"
\documentclass[a4paper]{article}
\usepackage{pdfpages}
\usepackage[margin=0cm]{geometry}
\pagestyle{empty}
\begin{document}
\includepdf[pages=-]{$mainPDF}
"@ | Out-File $tempTex -Encoding utf8

foreach ($att in $attachments) {
    $relPath = Join-Path "anhaenge" $att.Name
    "\includepdf[pages=-]{$relPath}" | Out-File $tempTex -Encoding utf8 -Append
}
"\end{document}" | Out-File $tempTex -Encoding utf8 -Append

# PDF bauen
Push-Location $attachDir
pdflatex -interaction=nonstopmode -halt-on-error merge_temp.tex > $null
Pop-Location

# Aufräumen & umbenennen
Remove-Item "$attachDir\merge_temp.aux","$attachDir\merge_temp.log","$attachDir\merge_temp.tex" -Force
Rename-Item "$attachDir\merge_temp.pdf" -NewName $outputPDF -Force

Write-Host "✅ Fertig: $attachDir\$outputPDF"
