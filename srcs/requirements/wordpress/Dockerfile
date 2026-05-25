FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	curl \
	php-fpm

# cli for WP service
RUN apt-get update && apt-get install -y \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wpi-cli.phar \
	&& mv cli-phar /usr/local/binwp


ENTRYPOINT ["/worpress.sh"]