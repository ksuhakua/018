#!/bin/bash

wget http://yoko.ukrtux.com:8899/versions.txt 
cat versions.txt | sort -u