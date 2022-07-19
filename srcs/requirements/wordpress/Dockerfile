FROM debian:buster

LABEL maintainer="ymehdi <ymehdi@student.42.fr>"

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install php7.3 php-gd php-mysql php-fpm php-cli php-mbstring php-curl
RUN apt-get -y install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql
RUN mkdir -p /run/php/
RUN chmod 777 /run/php/
RUN apt install mariadb-client -y
RUN apt install curl vim -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/*

COPY ./script/script.sh /
RUN chmod 777 /script.sh

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN wp core download --allow-root

EXPOSE 9000

ENTRYPOINT ["sh", "/script.sh"]
