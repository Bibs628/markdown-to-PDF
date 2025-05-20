#!/bin/bash
set -e

echo "Installiere Pandoc und wkhtmltopdf unter Linux..."

# Installiere Pandoc und wkhtmltopdf je nach Paketmanager
if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y pandoc wkhtmltopdf

elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Syu --noconfirm pandoc

    if command -v yay >/dev/null 2>&1; then
        yay -S --noconfirm wkhtmltopdf-bin
    elif command -v paru >/dev/null 2>&1; then
        paru -S --noconfirm wkhtmltopdf
    else
        echo "⚠️  Hinweis: 'wkhtmltopdf' ist nicht im offiziellen Repo."
        echo "Bitte installiere es manuell aus dem AUR:"
        echo "https://aur.archlinux.org/packages/wkhtmltopdf"
        exit 1
    fi

elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y pandoc wkhtmltopdf

else
    echo "❌ Kein unterstützter Paketmanager gefunden."
    echo "Bitte installiere Pandoc und wkhtmltopdf manuell:"
    echo "https://pandoc.org/installing.html"
    echo "https://wkhtmltopdf.org/downloads.html"
    exit 1
fi

echo "✅ Installation abgeschlossen."
