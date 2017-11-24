#! /usr/bin/env bash

docker build --rm -t redis:4.0.2-trib .
docker images
