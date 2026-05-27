# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thsykas <thsykas@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/21 00:56:33 by theo              #+#    #+#              #
#    Updated: 2026/05/25 14:29:19 by thsykas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE = docker compose -f srcs/docker-compose.yml
VOLUME_DB = /home/thsykas/data/mariadb_volume
WORDPRESS_VOLUME = /home/thsykas/data/wordpress_volume

init_create_dir:
	mkdir -p $(VOLUME_DB) $(WORDPRESS_VOLUME)

build: init_create_dir
## -p check if dir exist
	$(COMPOSE) build

up: init_create_dir
	$(COMPOSE) up

down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

fclean: down
	sudo rm -rf $(VOLUME_DB) $(WORDPRESS_VOLUME)

.PHONY: up down build logs