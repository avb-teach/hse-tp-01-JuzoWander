#!/bin/sh
read input_dir;
until who|grep -q "$input_dir";
do
    read output_dir;
done;