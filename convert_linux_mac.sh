#!/bin/bash
set -e

INPUT_DIR="./noch-zu-konvertieren"
OUTPUT_DIR="./Konvertiert"

mkdir -p "$OUTPUT_DIR"

for file in "$INPUT_DIR"/*.md; do
    [ -e "$file" ] || continue
    filename=$(basename "$file" .md)
    pandoc "$file" -o "$OUTPUT_DIR/${filename}.pdf"
    echo "Konvertiert: $file → $OUTPUT_DIR/${filename}.pdf"
done
