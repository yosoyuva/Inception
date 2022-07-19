

while ! mysql -h mariadb -u $DB_USER -p$DB_PASS $DB_NAME -e "SELECT 'OK' AS status;"; do
    sleep 5
done

  wp core config --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root
  wp core install --url=${SITE_URL} --title=${SITE_TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --skip-email --allow-root
  wp user create --allow-root ${USER_NAME} ${USER_EMAIL} --role=author --user_pass=${USER_PASS}


exec /usr/sbin/php-fpm7.3 --nodaemonize
