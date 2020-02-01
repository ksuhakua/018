#!/bin/bash

date=$(date +%Y.%m.%d)
echo "Please enter source directory:"
read source_dir
echo "Please enter backup directory:"
read backup_dir
mkdir -p $HOME/"$backup_dir"/"$date"
find $HOME/$source_dir/ -mtime -1 -exec cp  {} $HOME/$backup_dir/$date/ \;

#/Documents/PE
