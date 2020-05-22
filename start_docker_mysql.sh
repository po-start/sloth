#! /usr/bin/env bash

docker run --name=mysql_server -d -p 3306:3306 -v ${HOME}/Docker/db/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=hello123 mysql:5.7
##docker run --name=mysql_server --net-none -d -p 3306:3306 -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=hello123 mysql:5.7
##pipework docker0 mysql_server 172.17.0.2/16@172.17.0.1
docker ps
