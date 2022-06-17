FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y default-mysql-server procps bash

EXPOSE 3306

RUN mkdir -p /etc/mysql/mysql.conf.d
COPY ./mydb.cnf /etc/mysql/my.cnf

COPY ./begin.sh ./tmp
RUN chmod 777 ./tmp/begin.sh

CMD ["/tmp/begin.sh"]
