FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install php7.3 php-gd php-mysql php-fpm php-cli php-mbstring php-curl
RUN apt-get -y install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql
RUN mkdir -p /run/php/
RUN chmod 777 /run/php/
RUN apt install mariadb-client curl vim -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#RUN mkdir -p /user/src/wordpress
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/*
#RUN chown -R www-data:www-data /var/www/html

COPY ./tools/script.sh /
RUN chmod 755 /script.sh

#COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
#RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.3/fpm/pool.d/www.conf
#RUN service php7.3-fpm start \
#&&  service php7.3-fpm stop

WORKDIR /var/www/html


#RUN mkdir -p /var/www/html/wordpress
#WORKDIR /var/www/html/wordpress
RUN wp core download --allow-root


#RUN wp core download --path=/user/src/wordpress --allow-root
#se mettre dans repertoire (WORKID) telecher wordpress depuis wordpress.org unzip (tar) supprime l'archive)

#VOLUME [ "/var/www" ] doublon
#RUN apt-get clean

#RUN /usr/sbin/php-fpm7.3 --daemonize
EXPOSE 9000


ENTRYPOINT ["sh", "/script.sh"]

#db lancer avant wp ! via script ENTRYPOINT
#verifier si j'arrive a la base en verifiant la base et user
#wp-config existe  ?
