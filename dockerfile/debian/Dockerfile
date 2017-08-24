FROM debian:jessie

MAINTAINER liuxiangxi12@163.com

RUN apt update
RUN apt install -y libnet-ifconfig-wrapper-perl
RUN apt install -y vim 
RUN apt install -y iptables curl 

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "/usr/bin/entrypoint.sh"]
