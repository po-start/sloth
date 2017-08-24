#! /usr/bin/env bash

set -e

# Configuration rsyslog
sed -i '/#$ModLoad imudp/s/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf
sed -i '/#$UDPServerRun 514/s/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf
echo "local0.* /var/log/haproxy/haproxy.log" >> /etc/rsyslog.conf
service rsyslog restart

# Substitute variables in config file.
/bin/sed -i "s/{{ROUTER_ID}}/${ROUTER_ID}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{VIRTUAL_ROUTER_ID}}/${VIRTUAL_ROUTER_ID}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{PRIORITY}}/${PRIORITY}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{INTERFACE}}/${INTERFACE}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{MCAST_SRC_IP}}/${MCAST_SRC_IP}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{VIRTUAL_IP}}/${VIRTUAL_IP}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{AUTH_TYPE}}/${AUTH_TYPE}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{AUTH_PASS}}/${AUTH_PASS}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s/{{STATE}}/${STATE}/g" /etc/keepalived/keepalived.conf
/bin/sed -i "s#{{SCRIPT}}#${SCRIPT}#g" /etc/keepalived/keepalived.conf

if [ "${NOPREEMPT}"x == "1x"  ]
then
	/bin/sed -i "s/#nopreemp/nopreemp/g" /etc/keepalived/keepalived.conf
fi

if [ "${NOTIFY_MASTER}"x != "x" ]
then
	/bin/sed -i "s#{{NOTIFY_MASTER}}#${NOTIFY_MASTER}#g" /etc/keepalived/keepalived.conf
	/bin/sed -i "s/#notify_master/notify_master/g" /etc/keepalived/keepalived.conf
fi

if [ "${NOTIFY_BACKUP}"x != "x" ]
then
	/bin/sed -i "s#{{NOTIFY_BACKUP}}#${NOTIFY_BACKUP}#g" /etc/keepalived/keepalived.conf
	/bin/sed -i "s/#notify_backup/notify_backup/g" /etc/keepalived/keepalived.conf
fi

if [ "${NOTIFY_FAULT}"x != "x" ]
then
	/bin/sed -i "s#{{NOTIFY_FAULT}}#${NOTIFY_FAULT}#g" /etc/keepalived/keepalived.conf
	/bin/sed -i "s/#notify_fault/notify_fault/g" /etc/keepalived/keepalived.conf
fi

if [ "${NOTIFY}"x != "x" ]
then
	/bin/sed -i "s#{{NOTIFY}}#${NOTIFY}#g" /etc/keepalived/keepalived.conf
	/bin/sed -i "s/#notify/notify/g" /etc/keepalived/keepalived.conf
fi

service keepalived restart

haproxy -f /usr/local/etc/haproxy/haproxy.cfg
