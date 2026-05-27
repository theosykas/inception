#!/bin/bash

# cas ou une commande ne fonctionne pas
set -e


if [ ! -f "/etc/ssl/certs/nginx.crt" ]; then
	echo "create ssl certificate"
	openssl req -x509 -nodes -newkey rsa:4096 -days 3650 \
	-keyout /etc/ssl/private/nginx.key \
	-out  /etc/ssl/certs/nginx.crt \
	-sha256 \
	-subj "/CN=${DOMAIN}"
fi


# take pid1 position replace bash
echo "lunching nginx service deamon_off ..."
exec nginx -g "daemon off;"  # lunch serv ngnix