#! /usr/bin/env bash

docker run --name=mongodb_server -d -p 27017:27017 -v ${HOME}/Docker/db/mongodb:/data/db mongo:3.4.2
##docker run --name=mongodb_server --net=none -d -p 27017:27017 -v /data/mongodb:/data/db mongo:3.4.2
##pipework docker0 mongodb_server 172.17.0.3/16@172.17.0.1
docker ps
