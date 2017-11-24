#! /usr/bin/env bash

docker build --rm -t elasticsearch:5.6.3-plugins .
docker images
