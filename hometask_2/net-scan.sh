#!/bin/bash

echo "Please enter scan range:"
read range

for port in $range; do
  scan 80 443 #&&
   # echo "port 80 is open" ||
    #echo "port 443 is closed"
done
