#! /usr/bin/env bash

docker stop pmm-data
docker stop pmm-server
docker rm pmm-data
docker rm pmm-server
