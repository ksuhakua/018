#!/bin/bash

date=$(date +%Y.%m.%d)
echo "Please enter source directory:"
read source_dir
echo "Please enter backup directory:"
read source_dir
sudo mkdir $backup_dir/$date/
for file in $source_dir -mtime -1; do
       cp -pf {} $backup_dir/$date/ \;
done


#find $source_dir -mtime -1 -exec mkdir $backup_dir/$date/ & cp -pf {} $backup_dir/$date/ \;