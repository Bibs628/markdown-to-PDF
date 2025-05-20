#!/bin/bash
set -e

INPUT_DIR="noch-zu-konvertieren"
OUTPUT_DIR="Konvertiert"
TEMPLATE="templates/template.html"
DATE=$(date '+%d.%m.%Y %H:%M')
TMP_DIR="tmp_html"

mkdir -p "$OUTPUT_DIR"
mkdir -p "$TMP_DIR"

for file in "$INPUT_DIR"/*.md; do
  [ -e "$file" ] || continue
  filename=$(basename "$file" .md)
  html_path="$TMP_DIR/$filename.html"
  output_path="$OUTPUT_DIR/$filename.pdf"

  # Schritt 1: Markdown -> HTML mit Template
  pandoc "$file" \
    --from markdown \
    --to html5 \
    --standalone \
    --template="$TEMPLATE" \
    --metadata date="$DATE" \
    --output "$html_path"

  # Platzhalter im HTML durch relative Pfade ersetzen
  sed -i \
    -e "s|{{fachschaft_logo}}|templates/fachschaft_logo.png|g" \
    -e "s|{{vs_logo}}|templates/vs_logo.png|g" \
    "$html_path"

  # Schritt 2: HTML -> PDF mit wkhtmltopdf
  wkhtmltopdf --enable-local-file-access "$html_path" "$output_path"

  echo "Konvertiert: $file -> $output_path"
done

rm -r "$TMP_DIR"
