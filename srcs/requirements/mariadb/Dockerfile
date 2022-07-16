FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server mariadb-client -y

RUN apt-get clean

COPY ./tools/init-script.sh /
RUN chmod +x /init-script.sh

#RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["sh", "init-script.sh"]


#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
#COPY ./tools /var/www/

#RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql;

#CMD ["mysqld"]
