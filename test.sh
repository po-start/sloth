#! /usr/bin/env bash

docker run --name=mysqlserver -d -p 7000:3306 -e 'MYSQL_ROOT_PASSWORD=hello123' mysql:5.7
docker ps
