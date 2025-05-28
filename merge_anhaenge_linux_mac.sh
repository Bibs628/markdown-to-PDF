#!/usr/bin/env bash
# merge_attachments.sh
#
#  ▸ Aufruf ohne Argument im Projekt‑Root:
#        ./merge_attachments.sh
#  ▸ Oder mit explizitem Projektpfad:
#        ./merge_attachments.sh /pfad/zu/markdown-to-PDF
#
#  Ergebnis: haupt_anhaenge.pdf im Ordner anhaenge-hinzufuegen/
#  Voraussetzung: TeX Live mit pdfpages (bereits über install_*.sh vorhanden)

set -euo pipefail

# ──────────────────────────────────────────────────────────
# Projekt­verzeichnis bestimmen (1. Argument oder Skript­ort)
# ──────────────────────────────────────────────────────────
PROJECT_DIR="$(cd "${1:-$(dirname "$0")}" && pwd)"
ATTACH_DIR="$PROJECT_DIR/anhaenge-hinzufuegen"
SUBDIR="$ATTACH_DIR/anhaenge"

# ──────────────────────────────────────────────────────────
# Haupt‑PDF finden (erste PDF im Top‑Level von anhaenge‑hinzufuegen)
# ──────────────────────────────────────────────────────────
mapfile -t MAIN_PDFS < <(find "$ATTACH_DIR" -maxdepth 1 -type f -iname '*.pdf' | sort)

if [[ ${#MAIN_PDFS[@]} -eq 0 ]]; then
  echo "❌ Keine Haupt‑PDF in $ATTACH_DIR gefunden."
  exit 1
fi

MAIN_PDF="${MAIN_PDFS[0]}"
MAIN_NAME="$(basename "$MAIN_PDF")"
MAIN_STEM="${MAIN_NAME%.pdf}"
OUTPUT_PDF="${MAIN_STEM}_anhaenge.pdf"

echo "➤ Haupt‑PDF        : $MAIN_NAME"
echo "➤ Anhang‑Verzeichnis: $SUBDIR"

# ──────────────────────────────────────────────────────────
# Anhänge sammeln (alle PDFs im Unterordner anhaenge/)
# ──────────────────────────────────────────────────────────
mapfile -t ATT_PDFS < <(find "$SUBDIR" -maxdepth 1 -type f -iname '*.pdf' | sort)

if [[ ${#ATT_PDFS[@]} -eq 0 ]]; then
  echo "⚠️  Keine Anhänge gefunden – es wird nur das Hauptdokument übernommen."
fi

# ──────────────────────────────────────────────────────────
# Temporäre LaTeX‑Datei erstellen
# ──────────────────────────────────────────────────────────
TEX_FILE="$ATTACH_DIR/merge_temp.tex"

{
  printf '%% Autogeneriert – bitte nicht bearbeiten\n'
  printf '\\documentclass[a4paper]{article}\n'
  printf '\\usepackage{pdfpages}\n'
  printf '\\usepackage[margin=0cm]{geometry}\n'
  printf '\\pagestyle{empty}\n\\begin{document}\n'
  printf '\\includepdf[pages=-]{%s}\n' "$MAIN_NAME"
  for pdf in "${ATT_PDFS[@]}"; do
    rel="$(realpath --relative-to="$ATTACH_DIR" "$pdf")"
    printf '\\includepdf[pages=-]{%s}\n' "$rel"
  done
  printf '\\end{document}\n'
} > "$TEX_FILE"

# ──────────────────────────────────────────────────────────
# PDF bauen (pdflatex) und aufräumen
# ──────────────────────────────────────────────────────────
(
  cd "$ATTACH_DIR"
  pdflatex -interaction=nonstopmode -halt-on-error "$(basename "$TEX_FILE")" >/dev/null
  mv merge_temp.pdf "$OUTPUT_PDF"
  rm -f merge_temp.{aux,log,tex}
)

echo "✅ Fertig: $ATTACH_DIR/$OUTPUT_PDF"
