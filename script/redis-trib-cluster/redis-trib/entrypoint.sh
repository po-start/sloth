#! /usr/bin/env bash

/usr/src/redis/redis-3.2.8/src/redis-trib.rb create --replicas --yes ${NODE_SUM} ${REDIS_NODE}
##redis-server /usr/local/etc/redis/redis.conf
##redis-server
/usr/bin/env bash
