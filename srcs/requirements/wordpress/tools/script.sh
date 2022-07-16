while ! mysql -h mariadb -u $LOGIN_USER -p $PASS_USER $WEB_TITLE -e "SELECT 'OK' AS status;"; do
    sleep 5
done

  wp core config --dbhost=${DB_HOST} --dbname=${WEB_TITLE} --dbuser=${LOGIN_USER} --dbpass=${PASS_USER} --allow-root
  wp core install --url=${URL_WP} --title=${WP_TITLE} --admin_user=${WP_ROOT} --admin_password=${WP_ROOT_PW} --admin_email=${WP_ROOT_EMAIL} --skip-email --allow-root
  wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PW}

/usr/sbin/php-fpm7.3 --nodaemonize
#/usr/sbin/php-fpm7.3  -F -R
#/etc/init.d/php7.3-fpm start
#service php7.3-fpm start
