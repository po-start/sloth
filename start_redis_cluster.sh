#! /usr/bin/env bash

set -e

docker run --name=redis-cluster-server-master -d -p 7000:6379 -v ${HOME}/Docker/db/redis-cluster/redis-master:/data -v ${HOME}/Docker/config/redis-cluster/redis-master:/usr/local/etc/redis -v /Users/allen/Docker/logs/redis:/var/log/redis  redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
docker run --name=redis-cluster-server-slave-1 -d -p 7001:6379 --link redis-cluster-server-master:redis-cluster-server-master -v ${HOME}/Docker/config/redis-cluster/redis-slave:/usr/local/etc/redis -v /Users/allen/Docker/logs/redis:/var/log/redis redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
docker run --name=redis-cluster-server-slave-2 -d -p 7002:6379 --link redis-cluster-server-master:redis-cluster-server-master -v ${HOME}/Docker/config/redis-cluster/redis-slave:/usr/local/etc/redis -v /Users/allen/Docker/logs/redis:/var/log/redis redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
docker run --name=redis-cluster-server-slave-3 -d -p 7003:6379 --link redis-cluster-server-master:redis-cluster-server-master -v ${HOME}/Docker/config/redis-cluster/redis-slave:/usr/local/etc/redis -v /Users/allen/Docker/logs/redis:/var/log/redis redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
docker run --name=redis-cluster-server-slave-4 -d -p 7004:6379 --link redis-cluster-server-master:redis-cluster-server-master -v ${HOME}/Docker/config/redis-cluster/redis-slave:/usr/local/etc/redis -v /Users/allen/Docker/logs/redis:/var/log/redis redis:3.2.8 redis-server /usr/local/etc/redis/redis.conf
