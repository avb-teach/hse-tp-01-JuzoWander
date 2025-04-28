#!/bin/sh
# if [ $# -ne 2 ]; then
#   exit 1
# fi

INPUT_DIR=$1
OUTPUT_DIR=$2
if [$# -ne 2]; then
  max_depth=$3
fi

for file in $(find "$INPUT_DIR" -type f); do
  name=$(basename "$file")
  old_dir=${file#*/}
  new_file_dir="$2/$old_dir"
  ind=1
  while [-f "$new_file_dir"];do
    new_path=${new_file_dir%/*}
    new_file_dir="$new_path/${name%.*}$ind.${name##*.}"
    ((i++))
  done
  cp "$file" "$new_file_dir"
done
