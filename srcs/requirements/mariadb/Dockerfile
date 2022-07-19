FROM debian:buster

LABEL maintainer="ymehdi <ymehdi@student.42.fr>"

RUN apt-get update -y && apt-get upgrade -y && apt install mariadb-server -y

COPY ./script/init-script.sh /
RUN chmod +x /init-script.sh
RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["sh", "init-script.sh"]
