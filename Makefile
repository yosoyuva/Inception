DC_FILE = ./srcs/docker-compose.yml

DOCKER_COMPOSE = docker-compose -p inception --file $(DC_FILE)

all: volumes
	$(DOCKER_COMPOSE) up -d --build

volumes:
	-mkdir -p ~/data/
	-mkdir -p ~/data/mariadb
	-mkdir -p ~/data/wp
	-chmod 777 ~/data/
	-chmod 777 ~/data/mariadb
	-chmod 777 ~/data/wp

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clear_volume: down
	-docker volume rm inception_mariadb_db
	-docker volume rm inception_wordpress_vol

clear_image:
	-docker rmi nginx:ymehdi
	-docker rmi wordpress:ymehdi
	-docker rmi mariadb:ymehdi

clear: clear_volume clear_image
	-docker system prune -af
	-sudo rm -rf ~/data/

re: clear all
