#!/bin/sh

sed -i -e 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
wp core download --allow-root --path=/var/www/wordpress/
wp config create --allow-root \
				--dbname=wp_db \
				--dbuser=mshmelly \
				--dbhost=mariadb \
				--dbpass=${DB_PASS}\
				--path=/var/www/wordpress/
sleep 10
wp core install --allow-root \
				--url=mshmelly.42.fr \
				--title=inception \
				--admin_user=${WP_ADMIN}  \
				--admin_password=${WP_ADMIN_PASS}  \
				--admin_email=user@mail.com \
				--path=/var/www/wordpress/

wp user create ${WP_USER} user1@mail.com --role=author --user_pass=${WP_USER_PASS} --allow-root --path=/var/www/wordpress/

/usr/sbin/php-fpm7.3 -F --nodaemonize

