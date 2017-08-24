#! /usr/bin/env bash

docker-compose up -d
docker-compose scale redis-cluster-slave=4
##docker-compose scale redis-cluster-sentinel=4
docker-compose ps
