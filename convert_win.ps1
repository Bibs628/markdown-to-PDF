$InputDir = "noch-zu-konvertieren"
$OutputDir = "Konvertiert"
$Template = "CSA.tex"

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

Get-ChildItem -Path $InputDir -Filter *.md | ForEach-Object {
    $basename = $_.BaseName
    $outfile = Join-Path $OutputDir "$basename.pdf"
    Write-Host "Konvertiere: $($_.FullName) -> $outfile"
    pandoc $_.FullName --pdf-engine=xelatex --template=$Template -o $outfile
}