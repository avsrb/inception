FROM debian:buster

RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN apt-get -y install php7.3 php7.3-fpm php7.3-common php7.3-iconv php7.3-json \
    php7.3-curl php7.3-xml php7.3-mysqli php7.3-cgi php7.3-mbstring mariadb-client && \
    mkdir -p /var/www/wordpress/

RUN mkdir -p /run/php && \
    chmod 660 /run/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./begin.sh /
RUN chmod 777 /begin.sh

EXPOSE 9000

CMD ./begin.sh

