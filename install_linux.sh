#!/bin/bash
set -e

echo "Installiere Pandoc und LaTeX (TeX Live) unter Linux..."

read -p "Soll die Installation jetzt gestartet werden? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Abgebrochen."
    exit 0
fi

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y pandoc texlive texlive-latex-extra texlive-fonts-recommended

elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Syu --noconfirm pandoc texlive-core texlive-latexextra

elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y pandoc texlive-scheme-full

else
    echo "❌ Kein unterstützter Paketmanager gefunden."
    echo "Bitte installiere Pandoc und ein vollständiges TeX Live manuell:"
    echo "https://pandoc.org/installing.html"
    echo "https://www.tug.org/texlive/acquire-netinstall.html"
    exit 1
fi

# Font ins User-Fontverzeichnis kopieren und Fontcache aktualisieren
FONT_SOURCE="Fonts/unicode.futurab.ttf"
FONT_TARGET="$HOME/.local/share/fonts/unicode.futurab.ttf"

if [ -f "$FONT_SOURCE" ]; then
    mkdir -p "$HOME/.local/share/fonts"
    cp "$FONT_SOURCE" "$FONT_TARGET"
    fc-cache -f -v
    echo "✅ Schriftart unicode.futurab.ttf installiert und Fontcache aktualisiert."
else
    echo "⚠️  Schriftart unicode.futurab.ttf nicht gefunden. Bitte stelle sicher, dass sie im 'Fonts'-Ordner liegt."
fi

echo "✅ Installation abgeschlossen."