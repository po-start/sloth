#! /usr/bin/env bash

set -e

docker create -v /opt/prometheus/data -v /opt/consul-data -v /var/lib/mysql -v /var/lib/grafana --name pmm-data percona/pmm-server:1.2.0 /bin/true
