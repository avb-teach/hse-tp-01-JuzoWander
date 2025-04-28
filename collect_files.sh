#!/bin/sh
# if [ $# -ne 2 ]; then
#   exit 1
# fi

INPUT_DIR=$1
OUTPUT_DIR=$2
max_depth = 
if [$# -ne 2]; then
  max_depth=$3
  ((max_depth--))
  ((max_depth--))
fi

for file in $(find "$INPUT_DIR" -type f); do
  name=$(basename "$file")
  path=${file#$INPUT_DIR/}
  path=${path%/*}
  if [ -n "$max_depth" ];then
    while [ $(echo "$path" | tr -cd '/' | wc -c) -gt $max_depth ]; do
      path=${path#*/}
    done
  fi
  new_file_dir="$OUTPUT_DIR/$path/$name"
  ind=1
  while [-f "$new_file_dir"];do
    new_file_dir="$OUTPUT_DIR/$path/${name%.*}$ind.${name##*.}"
    ((ind++))
  done
  cp "$file" "$new_file_dir"
done
