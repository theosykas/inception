#!/bin/bash

if [! -d "name_dir"]; then
	echo@"create ssl certificate"
	openssl req -x509 -nodes -newkey rsa:4096 -days 3650 \
	-keyout /etc/ssl/private/ngnix.key \
	-out  /etc/ssl/certs/crt_ngnix.crt \
	-sha256 \
	-subj "/CN= $DOMAIN" && cat  $DOMAIN.crt  $DOMAIN.key >  $DOMAIN.pem