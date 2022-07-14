FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt install nginx openssl vim -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=x`75/L=Paris/O=42/CN=ymehdi' -keyout /etc/ssl/certs/ymehdi.42paris.key -out /etc/ssl/certs/ymehdi.42paris.crt

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/rights.sh .
CMD ["sh", "rights.sh"]
COPY ./tools/index.deb.html /var/www/html/index.deb.html

CMD ["nginx", "-g", "daemon off;"]
