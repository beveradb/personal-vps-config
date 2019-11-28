#!/bin/sh

docker run --detach \
    --name nginx-proxy \
    --publish 80:80 \
    --publish 443:443 \
    --volume /etc/nginx/certs \
    --volume /etc/nginx/vhost.d \
    --volume /usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy

docker run --detach \
    --name nginx-proxy-letsencrypt \
    --volumes-from nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --env "DEFAULT_EMAIL=andrew@beveridge.uk" \
    jrcs/letsencrypt-nginx-proxy-companion

docker run --detach \
    --name grafana \
    --env "VIRTUAL_HOST=grafana.beveradb.com" \
    --env "VIRTUAL_PORT=3000" \
    --env "LETSENCRYPT_HOST=grafana.beveradb.com" \
    --env "LETSENCRYPT_EMAIL=andrew@beveridge.uk" \
    grafana/grafana
