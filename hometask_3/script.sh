#!/bin/bash

#install MySQL
sudo apt-get update
sudo apt install mysql-server -y
sudo apt install mysql-client-core-5.7 -y

#configure database
echo "CREATE DATABASE IF NOT EXISTS CONFLUENCE" | mysql
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456'"
sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES"
sudo mysql -uroot -p'123456' -e "CREATE USER 'root'@'%' IDENTIFIED BY '123456'"
sudo mysql -uroot -p'123456' -e "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'localhost' IDENTIFIED BY '123456'"
sudo mysql -uroot -p'123456' -e "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'%'"
sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES"

#comment out config options to allow external access
sudo sed -i '39 s/^/#/' /etc/mysql/mysql.conf.d/mysqld.cnf 
sudo sed -i '43 s/^/#/' /etc/mysql/mysql.conf.d/mysqld.cnf 
sudo service mysql restart

#install Confluence
cd /vagrant/
sudo chmod +x atlassian-confluence-7.3.1-x64.bin
sudo ./atlassian-confluence-7.3.1-x64.bin -q