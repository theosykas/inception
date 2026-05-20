# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: theo <theo@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/21 00:56:33 by theo              #+#    #+#              #
#    Updated: 2026/05/21 01:03:14 by theo             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

build:
	docker compose -f docker-compose.yml -f build

up:
	docker compose -f docker-compose.yml up -f
down:
	docker compose -f docker-compose.yml down -f

ps:
	docker compose -f docker-compose.yml -f ps

logs:

.PHONY: up down build logs