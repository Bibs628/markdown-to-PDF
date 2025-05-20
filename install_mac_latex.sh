#!/bin/bash
set -e

echo "Installiere Pandoc und MacTeX unter macOS..."

if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew ist nicht installiert. Bitte installiere Homebrew zuerst: https://brew.sh/"
    exit 1
fi

brew update
brew install pandoc
brew install --cask mactex

echo "✅ Installation abgeschlossen."