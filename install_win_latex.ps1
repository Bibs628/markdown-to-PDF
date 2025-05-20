@echo off
echo Installiere Pandoc und MiKTeX unter Windows...

:: Installiere Pandoc
winget install --id=Pandoc.Pandoc -e

:: Installiere MiKTeX
winget install --id=MiKTeX.MiKTeX -e

echo Installation abgeschlossen.
pause