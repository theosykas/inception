#!/bin/bash

set -e

if [ -z "${MYSQL_USER}" ] || [ -z "${MYSQL_DATABASE}" ]; then
	echo "Error environement variable not valid"
	exit 1

fi

if [ ! -f "/run/secrets/db_root_password.txt"] || \
	[ ! -f "/run/secrets/db_password.txt"]; then
	echo "missing secrets passwd"
	exit 1

fi

DB_ADM_PASSWORD=$(cat /run/secrets/db_root_password.txt)
DB_PASSWORD=$(cat /run/secrets/db_password.txt)

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
echo "data base initialisation..."

mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

mysql_safe &

# attendre la creqtion de la DB
sleep 3

# emmbeded script in script comm with mariadb engine
# flush appliaue les droits
mysql -u root <<EOF
CRAEATE DATABASE IF NOT EXIST '\${MYSQL_DATABASE}\';
CREATE USER IF NOT EXIST '${MYSQL_USER}@'%' IDENTIFY BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "db create succesfully"

else
	echo "data base already exist"

fi


echo "lunching mariadb..."
exec "$@"