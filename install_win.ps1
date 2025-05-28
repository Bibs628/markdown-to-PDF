Write-Host "Installiere Pandoc und MiKTeX unter Windows..."

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "❌ winget ist nicht installiert. Bitte installiere winget oder lade Pandoc/MiKTeX manuell:"
    Write-Host "https://pandoc.org/installing.html"
    Write-Host "https://miktex.org/download"
    exit 1
}

$confirm = Read-Host "Soll die Installation jetzt gestartet werden? (yes/no)"
if ($confirm -ne "yes") {
    Write-Host "Abgebrochen."
    exit 0
}

# Installiere Pandoc
winget install --id=Pandoc.Pandoc -e

# Installiere MiKTeX
winget install --id=MiKTeX.MiKTeX -e

Write-Host "Installation abgeschlossen."
Pause