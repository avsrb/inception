include srcs/.env

DOCKER = cd srcs && sudo docker-compose -f ./docker-compose.yml

all:
	@ echo "127.0.0.1 mshmelly.42.fr" >> /etc/hosts
	mkdir -p $(DB_VOL)
	mkdir -p $(WP_VOL)
	cd srcs && sudo docker-compose up --build

up:
	$(DOCKER) up -d

start:
	$(DOCKER) start

down:
	$(DOCKER) down

ps:
	$(DOCKER) ps

clean:
	sudo rm -rf $(WP_VOLUME) $(DB_VOLUME)
 	sudo rm -rf /home/$(USER)/data/
 	sudo docker volume prune -f
 	sudo docker ps -aq | xargs --no-run-if-empty docker stop
 	sudo docker ps -aq | xargs --no-run-if-empty docker rm -v
 	sudo docker images -aq | xargs --no--run-if-empty rmi -v
 	sudo docker system prune -a --force

re: clean all
