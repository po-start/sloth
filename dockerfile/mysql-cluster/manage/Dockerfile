FROM debian:jessie

MAINTAINER liuxiangxi12@163.com

COPY ./bin/* /usr/local/bin/
RUN apt-get update \
	&& mkdir -p /var/lib/mysql-cluster \
	&& mkdir -p /usr/local/mysql/mysql-cluster

EXPOSE 1186
ENTRYPOINT ["/usr/local/bin/ndb_mgmd","--nodaemon","--config-file=/var/lib/mysql-cluster/config.ini","--config-dir=/var/lib/mysql-cluster/","--skip-config-cache"]
