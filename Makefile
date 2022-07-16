DC_FILE = ./srcs/docker-compose.yml

DOCKER_COMPOSE = docker-compose -p inception --file $(DC_FILE)

all: volumes
	$(DOCKER_COMPOSE) up -d --build

volumes:
	-mkdir -p /home/pthink/data/
	-mkdir -p /home/pthink/data/mariadb
	-mkdir -p /home/pthink/data/wp
	-chmod 777 /home/pthink/data/
	-chmod 777 /home/pthink/data/mariadb
	-chmod 777 /home/pthink/data/wp

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
	-docker rmi nginx:yuva
	-docker rmi wordpress:yuva
	-docker rmi mariadb:yuva

clear: clear_volume clear_image
	-docker system prune -af
	-sudo rm -rf /home/pthink/data/

re: clear all
