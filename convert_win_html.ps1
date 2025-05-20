# convert_win.ps1

# Ordner mit Markdown-Dateien
$inputFolder = "noch-zu-konvertieren"
$outputFolder = "Konvertiert"
$templatePath = "templates\template.html"

if (-not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

# Hole aktuelles Datum im Format TT.MM.JJJJ
$date = Get-Date -Format "dd.MM.yyyy"

# Alle .md Dateien im Eingabeordner
$files = Get-ChildItem -Path $inputFolder -Filter *.md

foreach ($file in $files) {
    $inputFile = $file.FullName
    $outputFile = Join-Path $outputFolder ($file.BaseName + ".pdf")

    Write-Host "Konvertiere $($file.Name) nach PDF..."

    pandoc $inputFile `
        --pdf-engine=wkhtmltopdf `
        --template=$templatePath `
        --metadata=date=$date `
        -o $outputFile
}

Write-Host "Konvertierung abgeschlossen. PDFs liegen in $outputFolder"
