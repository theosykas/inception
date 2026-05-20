#!/bin/bash

if [ ! -d "etc/ssl/private" ]; then
	echo "create ssl certificate"
	openssl req -x509 -nodes -newkey rsa:4096 -days 3650 \
	-keyout /etc/ssl/private/nginx.key \
	-out  /etc/ssl/certs/nginx.crt \
	-sha256 \
	-subj "/CN=$DOMAIN"
fi

nginx -g "daemon off;"  # lunch serv ngnix