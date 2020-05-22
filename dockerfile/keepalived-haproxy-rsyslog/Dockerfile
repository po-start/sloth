FROM haproxy:1.7.8 

MAINTAINER liuxiangxi12@163.com

RUN apt update
RUN apt install -y libnet-ifconfig-wrapper-perl bridge-utils
RUN apt install -y rsyslog
RUN apt install -y keepalived=1:1.2.13-1
RUN apt install -y iproute2 tcpdump
RUN mkdir -p /var/log/haproxy

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY keepalived.conf /etc/keepalived/keepalived.conf

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "/usr/bin/entrypoint.sh"]
