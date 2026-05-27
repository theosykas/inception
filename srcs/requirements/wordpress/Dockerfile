FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	curl \
	php8.2-fpm \
	php8.2-mysql  # communicate wp to DB

# cli for WP service
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY scripts/wordpress.sh /wordpress.sh
RUN chmod -R +x /wordpress.sh

ENTRYPOINT ["/wordpress.sh"]