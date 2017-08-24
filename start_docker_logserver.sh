#! /usr/bin/env bash

docker run --name=elasticsearch -d -p 9200:9200 -p 9300:9300 -v ${HOME}/Docker/db/elasticsearch:/usr/share/elasticsearch/data -v ${HOME}/Docker/config/elasticsearch/config:/usr/share/elasticsearch/config elasticsearch:5.2.1
docker run --name=logstash -it --link elasticsearch -v ${HOME}/logs/logstash:/var/log/logstash -e 'input { stdin { } } output { stdout { } }' logstash:5.4.0
docker run --name=kibana -d -p 5601:5601 --link elasticsearch kibana:5.4.0
docker ps
