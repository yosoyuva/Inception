FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server mariadb-client

COPY ./tools/init-script.sh /
RUN chmod +x /script.sh



COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql;

CMD ["mysqld"]
