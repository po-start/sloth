#! /usr/bin/env bash

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 8888 -j DNAT --to-destination 172.32.6.120:8888
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3100 -j DNAT --to-destination 172.32.6.120:3100
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3101 -j DNAT --to-destination 172.32.6.120:3101
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3200 -j DNAT --to-destination 172.32.6.120:3200

iptables -t nat -A POSTROUTING -s 172.32.6.0/24 -d 172.32.6.120 -p tcp -m tcp --dport 8888 -j SNAT --to-source 172.32.6.12
iptables -t nat -A POSTROUTING -s 172.32.6.0/24 -d 172.32.6.120 -p tcp -m tcp --dport 3100 -j SNAT --to-source 172.32.6.12
iptables -t nat -A POSTROUTING -s 172.32.6.0/24 -d 172.32.6.120 -p tcp -m tcp --dport 3101 -j SNAT --to-source 172.32.6.12
iptables -t nat -A POSTROUTING -s 172.32.6.0/24 -d 172.32.6.120 -p tcp -m tcp --dport 3200 -j SNAT --to-source 172.32.6.12

/usr/bin/env bash
