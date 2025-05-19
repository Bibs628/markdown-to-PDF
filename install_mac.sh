#!/bin/bash
set -e

echo "Pandoc wird unter macOS installiert..."
if ! command -v brew &>/dev/null; then
    echo "Homebrew wird benötigt. Installiere es von https://brew.sh/"
    exit 1
fi

brew install pandoc
