#! /usr/bin/env bash

docker build --rm -t redis-sentinel:0.1.1 .
docker images
