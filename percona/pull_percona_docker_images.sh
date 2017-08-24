#! /usr/bin/env bash

set -e

docker pull percona/percona-server:5.7.18
docker pull percona/pmm-server:1.2.0
docker images
