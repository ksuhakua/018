FROM ubuntu:16.04

MAINTAINER Oksana Lipkovska <ksuhakua@gmail.com>

RUN sudo apt-get update && apt-get install -y  mysql-server, mysql-client-core-5.7

ENV MYSQL_USER=mysql \
    MYSQL_VERSION=5.7.26 \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN echo "CREATE DATABASE IF NOT EXISTS CONFLUENCE" | mysql \
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456'" \
    sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES" \
    sudo mysql -uroot -p'123456' -e "CREATE USER 'root'@'%' IDENTIFIED BY '123456'" \
    sudo mysql -uroot -p'123456' -e "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'localhost' IDENTIFIED BY '123456'" \
    sudo mysql -uroot -p'123456' -e "GRANT ALL PRIVILEGES ON CONFLUENCE.* TO 'root'@'%'" \
    sudo mysql -uroot -p'123456' -e "FLUSH PRIVILEGES" \
    sudo sed -i '39 s/^/#/' /etc/mysql/mysql.conf.d/mysqld.cnf \
    sudo sed -i '43 s/^/#/' /etc/mysql/mysql.conf.d/mysqld.cnf \
    sudo service mysql restart

EXPOSE 3306/tcp

CMD ["/usr/sbin/mysql-server", "-D", "FOREGROUND"]
