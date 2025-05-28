#!/bin/bash
set -e

INPUT_DIR="noch-zu-konvertieren"
OUTPUT_DIR="Konvertiert"
DATE=$(date '+%d.%m.%Y %H-%M')

mkdir -p "$OUTPUT_DIR"

for file in "$INPUT_DIR"/*.md; do
  [ -e "$file" ] || continue
  filename=$(basename "$file" .md)
  output_path="$OUTPUT_DIR/$filename.pdf"

  echo "Verwende Template: $(realpath Eisvogel.tex)"
  echo "Verarbeite: $file -> $output_path"   # <--- Debug-Ausgabe

  # Pandoc Markdown zu PDF via LaTeX (xelatex empfohlen für bessere Unicode/Font-Unterstützung)
    pandoc "$file" \
    --from markdown \
    --pdf-engine=xelatex \
    --template="$(realpath templates/custom.tex)"   --variable date="$DATE" \
    --variable mainfont="Noto Sans" \
    --variable fontsize=11pt \
    --variable geometry="margin=2.5cm" \
    --output "$output_path"

  echo "Konvertiert (LaTeX): $file -> $output_path"
done