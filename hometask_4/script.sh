#!/bin/bash

#install MySQL
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

cd /vagrant/
docker build -t MySQL .
docker run --name sql_for_wordpress -i -t MySQL

#install Confluence
cd /vagrant/
sudo chmod +x atlassian-confluence-7.3.1-x64.bin
sudo ./atlassian-confluence-7.3.1-x64.bin -q