#! /usr/bin/env bash

set -e

sed -i '/#$ModLoad imudp/s/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf
sed -i '/#$UDPServerRun 514/s/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf
echo "local0.* /var/log/haproxy/haproxy.log" >> /etc/rsyslog.conf
service rsyslog restart
haproxy -f /usr/local/etc/haproxy/haproxy.cfg
