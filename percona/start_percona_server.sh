#! /usr/bin/env bash

set -e

bash -c "./create_percona_data.sh"
docker run -d --name=pmm-server -p 88:80 -p 444:443 --volumes-from pmm-data --restart always percona/pmm-server:1.2.0
docker ps
