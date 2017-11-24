#! /usr/bin/env bash

docker build --rm -t keepalived-haproxy-rsyslog:0.1.1 .
docker images
