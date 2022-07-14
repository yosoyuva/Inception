if [ ! -d "/var/lib/mysql/wordpress" ]; then
  CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
  GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
  FLUSH PRIVILEGES;
  CREATE DATABASE IF NOT EXISTS wp_wordpress;
fi
