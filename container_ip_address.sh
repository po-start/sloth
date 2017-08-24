#! /usr/bin/env bash

docker inspect --format='Container: {{.Name}}  |  IPAddress: {{.NetworkSettings.IPAddress}}  |  Image: {{.Config.Image}}' $(docker ps -a -q) | sed -e "s/\///"
