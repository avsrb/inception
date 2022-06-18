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
	sudo rm -rf $(WP_VOL) $(DB_VOL)
	sudo docker system prune -a -f --volumes
	sudo docker system prune -a -f
	sudo rm -rf /home/$(USER)/data/
	sudo docker ps -aq | xargs --no-run-if-empty docker stop
	sudo docker ps -aq | xargs --no-run-if-empty docker rm -v
	sudo docker volume ls -q | xargs --no-run-if-empty docker rm -f
	#sudo docker volume rm -f $$(sudo docker volume ls -q)
	sudo docker images -aq | xargs --no-run-if-empty docker rmi -f  
	sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null || echo ""
	sudo docker system prune -a --force

re: clean all
