#!/bin/bash

sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sed -i "s/\#port  /port   /" "/etc/mysql/mariadb.conf.d/50-server.cnf"
if [ ! -d /var/lib/mysql/wp_db/ ]; then
service mysql start
echo "CREATE DATABASE IF NOT EXISTS wp_db;"| mysql -u root
echo "CREATE USER IF NOT EXISTS 'mshmelly'@'%' IDENTIFIED BY '12345';"| mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'mshmelly'@'%' WITH GRANT OPTION;"| mysql -u root
echo "FLUSH PRIVILEGES;"| mysql -u root
mysqladmin -u root password ${DB_PASS}
service mysql stop
else
mkdir /var/run/mysqld
mkfifo var/run/mysqld/mysqld.sock
touch /var/run/mysqld/mysqld.pid
chown -R mysql /var/run/mysqld
fi
chown -R mysql:mysql /var/lib/mysql

mysqld