# install_win.ps1
$PandocUrl = "https://github.com/jgm/pandoc/releases/latest/download/pandoc-3.2-windows-x86_64.msi"
$WkhtmlUrl = "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/latest/download/wkhtmltox-0.12.6-1.msvc2015-win64.exe"

$PandocInstaller = "$env:TEMP\pandoc-installer.msi"
$WkhtmlInstaller = "$env:TEMP\wkhtmltopdf-installer.exe"

Write-Host "Lade Pandoc MSI-Installer herunter..."
Invoke-WebRequest -Uri $PandocUrl -OutFile $PandocInstaller

Write-Host "Starte stille Installation von Pandoc..."
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$PandocInstaller`" /quiet"

Write-Host "Lade wkhtmltopdf Installer herunter..."
Invoke-WebRequest -Uri $WkhtmlUrl -OutFile $WkhtmlInstaller

Write-Host "Starte stille Installation von wkhtmltopdf..."
Start-Process -FilePath $WkhtmlInstaller -ArgumentList "/SILENT" -Wait

# Prüfung
$PandocInstalled = Get-Command pandoc -ErrorAction SilentlyContinue
$WkhtmlInstalled = Get-Command wkhtmltopdf -ErrorAction SilentlyContinue

if ($PandocInstalled -and $WkhtmlInstalled) {
    Write-Host "✅ Pandoc und wkhtmltopdf wurden erfolgreich installiert."
} else {
    Write-Host "❌ Fehler: Die Installation scheint fehlgeschlagen zu sein. Bitte prüfe manuell:"
    Write-Host "https://pandoc.org/installing.html"
    Write-Host "https://wkhtmltopdf.org/downloads.html"
}
