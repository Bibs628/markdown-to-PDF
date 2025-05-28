#!/bin/bash
set -e

echo "Installiere Pandoc und MacTeX unter macOS..."
echo "Hinweis: MacTeX benötigt ca. 4GB freien Speicherplatz und der Download kann einige Zeit dauern."

read -p "Soll die Installation jetzt gestartet werden? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Abgebrochen."
    exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew ist nicht installiert. Bitte installiere Homebrew zuerst: https://brew.sh/"
    exit 1
fi

brew update
brew install pandoc
brew install --cask mactex

echo "✅ Installation abgeschlossen."