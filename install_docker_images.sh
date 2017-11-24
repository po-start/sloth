#! /usr/bin/env bash

set -e

docker pull redis:3.2.8
docker pull php:7.1.2-fpm
docker pull nginx:1.11
docker pull mysql:5.7
docker pull mongo:3.4.2
docker pull memcached:1.4.35
docker pull ubuntu:16.04
docker pull elasticsearch:5.6.3
docker images
