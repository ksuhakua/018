#!/bin/bash
#to run it weekly it's best to add it to crontab
#0 0 * * 0 path/to/script/auto_update.sh   or
#@weekly path/to/script/auto_update.sh
#run script with sudo to let it write into /var/log

#configure logrotate:
#sudo nano /etc/logrotate.d/update

#/var/log/update-*.log {
#    monthly
#    missingok
#    rotate 3
#    compress
#    notifempty
#}

date=$(date +%Y.%m.%d)
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>"/var/log/update-$date.log" 2>&1

echo -e "step 1: update apt cache"
sudo apt-get update 

echo

echo -e MSG2="step 2: upgrade packages"
sudo apt-get upgrade

echo

echo -e MSG3="step 3: remove unused packages"
sudo apt-get --purge autoremove

echo

echo -e MSG4="step 4: clean up"
sudo apt-get autoclean

echo
