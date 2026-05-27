FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	curl \
	php-fpm

# cli for WP service
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/binwp

COPY scripts/wordpress.sh /wordpress.sh
RUN chmod +x /wordpress.sh

ENTRYPOINT ["/wordpress.sh"]