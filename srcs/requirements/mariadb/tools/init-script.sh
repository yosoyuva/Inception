chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/$WEB_TITLE" ]; then
	service mysql start
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WEB_TITLE DEFAULT CHARACTER SET utf8;"
	mysql -u root -e "CREATE USER '$LOGIN_USER'@'%' IDENTIFIED BY '$PASS_USER';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $WEB_TITLE.* TO $LOGIN_USER@'%'"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysqladmin -u root password $PASS_ROOT
	service mysql stop
fi

exec /usr/bin/mysqld_safe
