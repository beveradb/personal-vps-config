#!/usr/bin/env bash

docker run --name beveradb.com-nginx -p 80:80 -v /root/build:/usr/share/nginx/html -d nginx 


