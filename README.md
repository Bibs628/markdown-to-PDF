# Markdown zu PDF Konverter

Dieses Projekt dient dazu, Markdown‑Dateien (`.md`) automatisch in PDF‑Dateien zu konvertieren. Mitgelieferte Skripte sorgen für die Installation der nötigen Software und die einfache Batch-Konvertierung – unter **Linux, macOS und Windows**.

Die PDF‑Erzeugung erfolgt mit [Pandoc](https://pandoc.org/) und einer LaTeX-Vorlage wie `Eisvogel.tex` oder `CSA.tex`.

---

## Projektstruktur

```text
markdown-to-PDF/
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
├── CSA.tex                    # Beispiel-LaTeX-Template (kann angepasst werden)
├── Eisvogel.tex               # Alternativ-Template, unterstützt viele Optionen
├── README.md                  # Diese Anleitung
```

---

## Voraussetzungen

* Die passenden Installationsskripte installieren **Pandoc** automatisch.
* Optional und empfohlen für schönere PDFs: eine LaTeX‑Distribution (`texlive`, `tectonic`, `MiKTeX`).

---

## Windows

### Installation

1. Öffne eine **PowerShell als Administrator** im Projektverzeichnis.
2. Führe das Skript aus:

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ./install_win.ps1
   ```

   Das Skript lädt die aktuelle Pandoc‑Version als MSI herunter und installiert sie still im Hintergrund.

   **Kein Admin‑Konto?** → Pandoc manuell installieren: [https://pandoc.org/installing.html](https://pandoc.org/installing.html)

### Konvertierung

1. Lege alle `.md`‑Dateien in den Ordner `noch-zu-konvertieren/`.
2. Starte die Konvertierung:

   ```powershell
   ./convert_win.ps1
   ```

   Alle erzeugten PDF‑Dateien findest du anschließend im Ordner `Konvertiert/`.  
   Die PDF-Namen entsprechen den ursprünglichen `.md`-Dateinamen.

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

   Die erzeugten PDF‑Dateien erscheinen im Ordner `Konvertiert/` und behalten den Namen der Quelldatei.

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

## Hinweise und Tipps

- Die LaTeX-Templates (`CSA.tex`) kann individuell angepasst werden, jedoch ist das nicht zu Empfehlen.
- Bilder für Titelseite oder Header/Fußzeile müssen im richtigen Ordner liegen (meistens im Projektverzeichnis, keine Unterstriche im Dateinamen verwenden). 
- YAML-Optionen sind am Anfang einer .md datei zu verwenden und sollte diesem Format folgen:
```
---
title: "Protokoll der Fachschaftschaftssitzung"
titlepage-logo: "titlepage.png"
author: [Fachschaft Computer Science & Application]
date: "aktueles Datum (DD.MM.YYYY)"
titlepage: true
toc-own-pag: true
...
```
---

## Beispielprotokoll

Eine Datei `Beispiel.md` liegt dem Repository bei. Kopiere sie nach `noch-zu-konvertieren/` und führe das jeweilige Konvertierungsskript aus, um das Setup zu testen.

---

## Fragen oder Probleme?

- Prüfe mit `pandoc --version`, ob Pandoc korrekt installiert ist.
- Stelle sicher, dass du Schreibrechte für die Ordner `noch-zu-konvertieren/` und `Konvertiert/` hast.
- Fehlermeldungen zur LaTeX‑Engine? → Installiere eine LaTeX‑Distribution (`texlive`, `MiKTeX`, `tectonic`).
- Die Latex-Vorlage basiert auf der [Eisvogel-Vorlage](https://github.com/Wandmalfarbe/pandoc-latex-template=).
---
