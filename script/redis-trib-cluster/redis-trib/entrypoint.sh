#! /usr/bin/env bash

/usr/src/redis/redis-3.2.8/src/redis-trib.rb create --replicas --yes ${NODE_SUM} ${REDIS_NODE}

PASSWORD="hello123"

OLD_IFS="$IFS"
IFS=" "
REDIS_ARR=($REDIS_NODE)

for item in ${REDIS_ARR[@]}
do
	IFS=":"
	node=($item)
	ip=${node[0]}
	port=${node[1]}
	## 启动后设置集群密码
	echo "config set masterauth ${PASSWORD}" | redis-cli -p ${port} -h ${ip}
	echo "config set requirepass ${PASSWORD}" | redis-cli -p ${port} -h ${ip}
done

IFS="$OLD_IFS"
/usr/bin/env bash
