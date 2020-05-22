#! /usr/bin/env bash

docker run --name=nginx_server -v ${HOME}/Docker/config/nginx/conf.d:/etc/nginx/conf.d -p 80:80 -p 443:443 -d nginx:1.11
docker ps
