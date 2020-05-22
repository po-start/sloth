#! /usr/bin/env bash

## 检查haproxy进程
count=$(ps -C haproxy --no-heading | wc -l)

if [ "${count}" = "0" ]
then
	## 尝试启动一次
	/bin/bash -c /usr/bin/entrypoint.sh 
	sleep 2
	count=$(ps -C nginx --no-heading | wc -l)
	if [ "${count}" = "0" ]; then
		/etc/init.d/keepalived stop
		echo "==========================" >> /var/log/messages
		echo "  keepalived server stop  " >> /var/log/messages
		echo "==========================" >> /var/log/messages
	else
		exit 0
	fi
else
	exit 0
fi
