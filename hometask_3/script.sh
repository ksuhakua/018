#!/bin/bash

#install MySQL
sudo apt-get update
sudo apt install mysql-server -y
sudo apt install mysql-client-core-5.7 -y

#configure database
echo "CREATE DATABASE IF NOT EXISTS CONFLUENCE" | mysql
sudo mysql -e "CREATE USER 'root'@'localhost' IDENTIFIED BY '123456'"
sudo mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '123456'"
echo "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'localhost' IDENTIFIED BY '123456'" | mysql
echo "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'%'" | mysql
echo "FLUSH PRIVILEGES" | mysql

#install Confluence
cd /vagrant/
sudo chmod +x atlassian-confluence-7.3.1-x64.bin
sudo ./atlassian-confluence-7.3.1-x64.bin -q

#sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456'"
#sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES"
#mysql -uroot -p123456 <<MYSQL_SCRIPT
#CREATE DATABASE CONFLUENCE;
#CREATE USER 'root'@'%' IDENTIFIED BY '123456';
#GRANT ALL PRIVILEGES ON $"CONFLUENCE".* TO 'root'@'localhost';
#GRANT ALL PRIVILEGES ON $"CONFLUENCE".* TO 'root'@'%';
#FLUSH PRIVILEGES;
#MYSQL_SCRIPT

#sudo mysql -e "CREATE USER 'root'@'localhost' IDENTIFIED BY '123456'"
#sudo mysql -uroot -p'123456' -e "CREATE DATABASE CONFLUENCE"
#sudo mysql -uroot -p'123456' -e "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'CONFLUENCE'@'localhost' IDENTIFIED BY '123456'"
#sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES"