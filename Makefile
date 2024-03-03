S = srcs/

NAME = inception

SRCS = $Sdocker-compose.yml

all: up

up:
	mkdir -p ${HOME}/data/mdb_data
	mkdir -p ${HOME}/data/wp_data
	docker-compose -f $(SRCS) build \
	&& docker-compose -f $(SRCS) up -d

down:
	docker-compose -f $(SRCS) down

stop:
	docker-compose -f $(SRCS) stop

fclean: down
	docker rmi -f $$(docker images -qa);\
	docker system prune -a --force

re: fclean all

.PHONY: all logs down fclean re