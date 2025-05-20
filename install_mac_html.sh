#!/bin/bash
set -e

echo "Pandoc und wkhtmltopdf werden unter macOS installiert..."

if ! command -v brew &>/dev/null; then
    echo "❌ Homebrew ist nicht installiert. Installiere es von https://brew.sh/"
    exit 1
fi

brew install pandoc wkhtmltopdf

echo "✅ Installation abgeschlossen."
