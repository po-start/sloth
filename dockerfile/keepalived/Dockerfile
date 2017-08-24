FROM debian:jessie

MAINTAINER liuxiangxi12@163.com

RUN apt update
RUN apt install -y keepalived=1:1.2.13-1
RUN apt install -y iproute2 tcpdump

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY keepalived.conf /etc/keepalived/keepalived.conf

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "/usr/bin/entrypoint.sh"]
