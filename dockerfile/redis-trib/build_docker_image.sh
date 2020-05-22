#! /usr/bin/env bash

docker build --rm -t redis:3.2.8-trib .
docker images
