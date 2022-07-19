FROM debian:buster

LABEL maintainer="ymehdi <ymehdi@student.42.fr>"

RUN apt-get update -y && apt-get upgrade -y && apt install nginx openssl vim -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=ymehdi" -keyout /etc/ssl/certs/ymehdi.42paris.key -out /etc/ssl/certs/ymehdi.42paris.crt
RUN chmod 755 /var/www/html

COPY ./conf/default /etc/nginx/sites-available/default
COPY ./conf/index.deb.html /var/www/html/index.deb.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
