#! /usr/bin/env bash

docker build --rm -t haproxy:1.7.8-rsyslog .
docker images
