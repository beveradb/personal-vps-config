#!/bin/sh

docker rm -f `docker ps -aq`
docker system prune -f

docker-compose up -d

docker-compose logs -f

