#!/bin/sh
if [ $# -ne 2 ]; then
  exit 1
fi

INPUT_DIR=$1
OUTPUT_DIR=$2