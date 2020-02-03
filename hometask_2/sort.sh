#!/bin/bash

if [ -f "versions.txt" ]; then
    echo "versions.txt exist"
else 
    wget http://yoko.ukrtux.com:8899/versions.txt 
fi
cat versions.txt | sort -u