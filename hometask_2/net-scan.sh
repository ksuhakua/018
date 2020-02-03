#!/bin/bash

for i in {0..255}; 
  do nc -n -z -w 2 192.168.1.$i 80; nc -n -z -w 2 192.168.1.$i 443
done
