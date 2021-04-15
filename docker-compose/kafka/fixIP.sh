#! /usr/bin/env bash

scriptPath=$(cd `dirname $0`; pwd)

metapath=${HOME}/Docker/db/kafka/kafka-1/kafka-logs-kafka-1/meta.properties
echo "delete ${metapath}"
rm -rf ${metapath}

ip=`ifconfig | grep "inet " | grep -v 127.0.0.1 | awk 'NR==1' | awk -F ' ' '{print $2}'`
echo $ip
sed -i "" "s/^.*KAFKA_ADVERTISED_HOST_NAME.*$/      - \"KAFKA_ADVERTISED_HOST_NAME=${ip}\"/g" ./docker-compose.yaml
#sed -i "" "s/^.*KAFKA_ADVERTISED_LISTENERS.*$/      - \"KAFKA_ADVERTISED_LISTENERS=PLAINTEXT:\/\/${ip}:9092\"/g" ./docker-compose.yaml
#sed -i "" "s/^.*KAFKA_LISTENERS=PLAINTEXT.*$/      - \"KAFKA_LISTENERS=PLAINTEXT:\/\/${ip}:9092\"/g" ./docker-compose.yaml
docker-compose kill && docker-compose rm -f && docker-compose up -d && docker ps
