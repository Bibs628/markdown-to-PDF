# install_win.ps1
$PandocUrl = "https://github.com/jgm/pandoc/releases/latest/download/pandoc-3.2-windows-x86_64.msi"
$InstallerPath = "$env:TEMP\pandoc-installer.msi"

Write-Host "Lade Pandoc MSI-Installer herunter..."
Invoke-WebRequest -Uri $PandocUrl -OutFile $InstallerPath

Write-Host "Starte stille Installation..."
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$InstallerPath`" /quiet"

if (Get-Command pandoc -ErrorAction SilentlyContinue) {
    Write-Host "✅ Pandoc wurde erfolgreich installiert."
} else {
    Write-Host "❌ Fehler: Pandoc scheint nicht korrekt installiert zu sein. Bitte prüfe manuell."
}
