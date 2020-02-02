#!/bin/bash

date=$(date +%Y.%m.%d)

echo -e MSG1="step 1: update apt cache"
sudo apt-get update
echo "step 1: $MSG1" >> /var/log/"update-$date".log

echo

echo -e MSG2="step 2: upgrade packages"
sudo apt-get upgrade
echo "step 2: $MSG2" >> /var/log/"update-$date".log

echo

echo -e MSG3="step 3: remove unused packages"
sudo apt-get --purge autoremove
echo "step 3: $MSG3" >> /var/log/"update-$date".log

echo

echo -e MSG4="step 4: clean up"
sudo apt-get autoclean
echo "step 4: $MSG4" >> /var/log/"update-$date".log

echo