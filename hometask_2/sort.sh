#!/bin/bash

if [ -f "versions.txt" ]; then
    echo "versions.txt exists"
else 
    wget http://yoko.ukrtux.com:8899/versions.txt 
fi
cat versions.txt | sort -u