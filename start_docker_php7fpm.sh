#! /usr/bin/env bash

docker run --name=php7fpm -d -p 9000:9000 php:7.1.2-fpm
docker ps
