# Markdown zu PDF Konverter

Dieses Projekt dient dazu, Markdown‑Dateien (`.md`) automatisch in PDF‑Dateien zu konvertieren. Alle benötigten Programme können durch die beigefügten Skripte installiert werden; die Ordnerstruktur sorgt für eine übersichtliche und einfache Konvertierung.

Die PDF‑Erzeugung erfolgt mit [Pandoc](https://pandoc.org/) und funktioniert unter Linux, macOS und Windows.

---

## Projektstruktur

```text
markdown-pdf-konverter/
├── noch-zu-konvertieren/      # Hier kommen die Markdown-Dateien rein
├── Konvertiert/               # Hier landen die generierten PDF-Dateien
│
├── install_linux.sh           # Installation für Linux (Debian, Arch, Fedora …)
├── install_mac.sh             # Installation für macOS (Homebrew erforderlich)
├── install_win.ps1            # Installation für Windows (PowerShell, lädt MSI‑Installer)
│
├── convert_linux_mac.sh       # Konvertierung für Linux & macOS
├── convert_win.ps1            # Konvertierung für Windows (PowerShell)
│
└── README.md                  # Diese Anleitung
```

---

## Voraussetzungen

* Die passenden Installationsskripte installieren Pandoc automatisch.
* Optional, aber empfohlen für schönere PDFs: eine LaTeX‑Distribution (z. B. `texlive`, `tectonic`, `MiKTeX`).

---

## Windows

### Installation

1. Öffne eine PowerShell **als Administrator** im Projektverzeichnis.
2. Führe das Skript aus:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
./install_win.ps1
```

Das Skript lädt die aktuelle Pandoc‑Version als MSI herunter und installiert sie still im Hintergrund.

*Kein Admin‑Konto?*  → Pandoc manuell installieren: [https://pandoc.org/installing.html](https://pandoc.org/installing.html)

### Konvertierung

1. Lege alle `.md`‑Dateien in den Ordner `noch-zu-konvertieren/`.
2. Starte die Konvertierung:

```powershell
./convert_win.ps1
```

Alle erzeugten PDF‑Dateien findest du anschließend im Ordner `Konvertiert/`.

---

## Linux

### Installation

1. Öffne ein Terminal im Projektverzeichnis.
2. Mache das Skript ausführbar (nur beim ersten Mal):

```bash
chmod +x install_linux.sh
```

3. Führe das Skript aus:

```bash
./install_linux.sh
```

Das Skript erkennt automatisch `apt`, `pacman`, `dnf` oder `pamac` und installiert Pandoc.

### Konvertierung

1. Kopiere deine `.md`‑Dateien in den Ordner `noch-zu-konvertieren/`.
2. Mache das Konvertierungsskript ausführbar (nur beim ersten Mal):

```bash
chmod +x convert_linux_mac.sh
```

3. Starte die Konvertierung:

```bash
./convert_linux_mac.sh
```

Die erzeugten PDF‑Dateien erscheinen im Ordner `Konvertiert/`.

---

## Mac

### Installation

1. Stelle sicher, dass [Homebrew](https://brew.sh) installiert ist.
2. Öffne das Terminal im Projektverzeichnis.
3. Mache das Skript ausführbar (nur beim ersten Mal):

```bash
chmod +x install_mac.sh
```

4. Führe das Skript aus:

```bash
./install_mac.sh
```

Pandoc wird über Homebrew installiert.

### Konvertierung

1. Lege deine `.md`‑Dateien in den Ordner `noch-zu-konvertieren/`.
2. Mache das Konvertierungsskript ausführbar (nur beim ersten Mal):

```bash
chmod +x convert_linux_mac.sh
```

3. Starte die Konvertierung:

```bash
./convert_linux_mac.sh
```

Die PDF‑Ausgaben findest du anschließend im Ordner `Konvertiert/`.

---

## Fragen oder Probleme?

* Überprüfe mit `pandoc --version`, ob Pandoc korrekt installiert ist.
* Stelle sicher, dass du Schreibrechte für die Ordner `noch-zu-konvertieren/` und `Konvertiert/` hast.
* Fehlermeldungen zur LaTeX‑Engine?  → Installiere eine LaTeX‑Distribution (z. B. `texlive`, `MiKTeX`, `tectonic`).

---

## Beispielprotokoll

Eine Datei `beispielprotokoll.md` liegt dem Repository bei. Kopiere sie in `noch-zu-konvertieren/` und führe das jeweilige Konvertierungsskript aus, um das Setup zu testen.
