FROM haproxy:1.7.8

MAINTAINER liuxiangxi12@163.com

RUN apt update \
	&& apt install -y rsyslog \
#	&& sed -i '/#$ModLoad imudp/s/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf \
#	&& sed -i '/#$UDPServerRun 514/s/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf \
	&& mkdir -p /var/log/haproxy
#	&& echo "local0.* /var/log/haproxy/haproxy.log" >> /etc/rsyslog.conf 

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
