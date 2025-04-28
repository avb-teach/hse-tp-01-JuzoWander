#!/bin/sh
if [ $# -ne 2 ]; then
  exit 1
fi

INPUT_DIR=$1
OUTPUT_DIR=$2

for file in $(find "$INPUT_DIR" -type f); do
  name=$(basename "$file")
  new_file_dir="$2/$name"
  cp "$file" "$new_file_dir"
done
