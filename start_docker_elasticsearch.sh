#! /usr/bin/env bash

docker run --name=elasticsearch -d -p 9200:9200 -p 9300:9300 -v ${HOME}/Docker/db/elasticsearch:/usr/share/elasticsearch/data -v ${HOME}/Docker/config/elasticsearch/config:/usr/share/elasticsearch/config elasticsearch:5.2.1
docker ps
