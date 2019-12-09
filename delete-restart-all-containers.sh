#!/bin/sh

docker rm -f `docker ps -aq`
docker volume prune -f
docker system prune -f

docker-compose -f /root/personal-vps-config/docker-compose.yml up -d 

docker-compose -f /root/personal-vps-config/docker-compose.yml logs -f

