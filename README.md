# 📝 Markdown zu PDF Konverter

Dieses Projekt dient dazu, Markdown-Dateien (`.md`) automatisch in PDF-Dateien zu konvertieren. 

Die Konvertierung erfolgt mit [Pandoc](https://pandoc.org/) und funktioniert auf **Linux**, **macOS** und **Windows**.

---

## 📁 Projektstruktur

markdown-pdf-konverter/
├── noch-zu-konvertieren/ # Hier kommen die Markdown-Dateien rein
├── Konvertiert/ # Hier landen die generierten PDF-Dateien
Installationsskripte

├── install_linux.sh # Für Linux (Debian, Arch, Fedora)
├── install_mac.sh # Für macOS (Homebrew erforderlich)
├── install_win.ps1 # Für Windows (PowerShell, lädt MSI-Installer)
Konvertierungsskripte

├── convert_linux_mac.sh # Für Linux & macOS
├── convert_win.ps1 # Für Windows (PowerShell)

└── README.md # Diese Anleitung


---

## ✅ Voraussetzungen

- **Pandoc** wird automatisch über die Installationsskripte installiert.
- Optional: Für bessere PDF-Formatierung kannst du LaTeX installieren (z. B. `texlive`, `MiKTeX`).

---

## 🔧 Installation

### 🐧 Linux

1. Öffne ein Terminal.
2. Stelle sicher, dass du `bash` und ein Paketmanager wie `apt`, `pacman` oder `dnf` hast.
3. Führe das Skript aus:

```bash
chmod +x install_linux.sh
./install_linux.sh

🍏 macOS

    Stelle sicher, dass Homebrew installiert ist.

    Öffne das Terminal und führe aus:

chmod +x install_mac.sh
./install_mac.sh

🪟 Windows

    Rechtsklick auf install_win.ps1 > Mit PowerShell ausführen als Administrator

    Der Installer lädt automatisch die aktuellste Pandoc-Version herunter und installiert sie still im Hintergrund.

Falls du keine Admin-Rechte hast, installiere Pandoc manuell:
👉 https://pandoc.org/installing.html
📤 Konvertierung
📥 Dateien hinzufügen

Lege deine Markdown-Dateien in den Ordner noch-zu-konvertieren/.

    Jede Datei muss die Endung .md haben, z. B. protokoll1.md.

🐧 Linux & 🍏 macOS

chmod +x convert_linux_mac.sh
./convert_linux_mac.sh

Ergebnis: Alle PDFs landen im Ordner Konvertiert/.
🪟 Windows

.\convert_win.ps1

Ergebnis: Alle PDFs landen im Ordner Konvertiert/.