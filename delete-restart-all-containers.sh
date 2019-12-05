#!/bin/sh

docker rm -f `docker ps -aq`
docker system prune -f

cd docker-compose-letsencrypt-nginx-proxy-companion
./start.sh
cd ..

docker run --detach \
    --name grafana \
    --network=webproxy \
    --env "VIRTUAL_HOST=grafana.beveradb.com" \
    --env "VIRTUAL_PORT=3000" \
    --env "LETSENCRYPT_HOST=grafana.beveradb.com" \
    --env "LETSENCRYPT_EMAIL=andrew@beveridge.uk" \
    grafana/grafana

docker run --detach \
    --name homearea \
    --network=webproxy \
    --env "VIRTUAL_HOST=homearea.beveradb.com" \
    --env "VIRTUAL_PORT=3000" \
    --env "LETSENCRYPT_HOST=homearea.beveradb.com" \
    --env "LETSENCRYPT_EMAIL=andrew@beveridge.uk" \
    homeareainfo



