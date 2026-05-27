#!/bin/bash

# cas ou une commande ne fonctionne pas
set -e

cd /var/www/html

if [ ! -f "wp-config.php" ]; then
	echo "Wordpress not found, init in progress"
	wp core download --allow-root

	# create config.php with database(mariaDB) and check data_base content
	# code for php load db ...
	wp config create \
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_USER}" \
		--dbpass="${MYSQL_PASSWORD}" \
		--dbhost="mariadb" \
		--allow-root

	# create admin user + init WP
	wp core install \
		--url=${DOMAIN_NAME} \
		--title="inception_wp" \
		--admin_user="${WP_USER_ADMIN}" \
		--admin_password="${WP_ADMIN_PASSWD}" \
		--admin_email="${WP_ADMIN_MAIL}" \
		--allow-root

	# guest user
	wp user create \
		"${WP_USER_GUEST}" \
		"${WP_GUEST_MAIL}" \
		--user_pass="${WP_GUEST_PASSWD}" \
		--role=author \
		--allow-root

	echo "wordpress init completed succesfully"

else
	echo "wordpress already exist and configurated"

fi

echo "lunching PHP_FPM..."
# -F enforce PID 1
exec php-fpm8.2 -F