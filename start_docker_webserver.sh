#! /usr/bin/env bash

docker run --name=redisserver -d -p 6379:6379 -v ${HOME}/Docker/db/redis:/data -v ${HOME}/Docker/config/redis:/usr/local/etc/redis  redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
docker run --name=memcachedserver -d -p 11211:11211 memcached:1.4.35
docker run --name=mongodbserver -d -p 27017:27017 -v ${HOME}/Docker/db/mongodb:/data/db mongo:3.4.2
docker run --name=mysqlserver -d -p 3306:3306 -v ${HOME}/Docker/db/mysql:/var/lib/mysql -v ${HOME}/Docker/config/mysql/mysql.conf.d:/etc/mysql/mysql.conf.d -v ${HOME}/Docker/logs/mysql:/var/log/mysql -e 'MYSQL_ROOT_PASSWORD=hello123' mysql:5.7
docker run --name=phpwebserver -d -p 9000:9000 --link mysqlserver:mysqlserver --link mongodbserver:mongodbserver --link redisserver:redisserver --link memcachedserver:memcachedserver -v /Users/allen/webstore:/data/webstore thinkphp:0.2.2
docker run --name=nginxwebserver -d -p 80:80 -p 443:443 --link phpwebserver:phpwebserver -v ${HOME}/Docker/config/nginx/conf.d:/etc/nginx/conf.d -v ${HOME}/Docker/logs/nginx:/var/log/nginx --volumes-from=phpwebserver nginx:1.11
docker ps
