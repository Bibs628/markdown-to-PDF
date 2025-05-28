#!/bin/bash
set -e

INPUT_DIR="noch-zu-konvertieren"
OUTPUT_DIR="Konvertiert"
TEMPLATE="CSA.tex"

mkdir -p "$OUTPUT_DIR"

for file in "$INPUT_DIR"/*.md; do
  [ -e "$file" ] || continue
  filename=$(basename "$file" .md)
  output_path="$OUTPUT_DIR/$filename.pdf"

  echo "Konvertiere: $file -> $output_path"
  pandoc "$file" \
    --pdf-engine=xelatex \
    --template="$TEMPLATE" \
    -o "$output_path"
done