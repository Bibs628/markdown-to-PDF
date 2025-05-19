#!/bin/bash
set -e

echo "Pandoc wird unter Linux installiert..."
if command -v pandoc >/dev/null 2>&1; then
    echo "Pandoc ist bereits installiert."
else
    if [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install -y pandoc
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -S --noconfirm pandoc
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y pandoc
    else
        echo "Bitte installiere Pandoc manuell: https://pandoc.org/installing.html"
        exit 1
    fi
fi
