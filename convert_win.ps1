$InputDir = "noch-zu-konvertieren"
$OutputDir = "Konvertiert"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

Get-ChildItem -Path $InputDir -Filter *.md | ForEach-Object {
    $inputFile = $_.FullName
    $outputFile = Join-Path $OutputDir ($_.BaseName + ".pdf")
    pandoc $inputFile -o $outputFile
    Write-Host "Konvertiert: $inputFile → $outputFile"
}
