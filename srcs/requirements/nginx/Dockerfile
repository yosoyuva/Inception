FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt install nginx openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=x`75/L=Paris/O=42/CN=ymehdi' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/rights.sh .
CMD ["sh", "rights.sh"]

CMD ["nginx", "-g", "daemon off;"]
