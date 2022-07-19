chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
	service mysql start
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
	mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%'"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysqladmin -u root password $ROOT_PASS
	service mysql stop
fi

exec /usr/bin/mysqld_safe
