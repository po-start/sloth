FROM debian:jessie

MAINTAINER liuxiangxi12@163.com

COPY ./mysql-cluster-gpl-7.5.7-linux-glibc2.12-x86_64.tar.gz /mysql-cluster-gpl-7.5.7-linux-glibc2.12-x86_64.tar.gz
RUN apt-get update \
	&& cd / && tar xvf mysql-cluster-gpl-7.5.4-linux-glibc2.5-x86_64.tar.gz \
	&& cd mysql-cluster-gpl-7.5.4-linux-glibc2.5-x86_64 \
	&& cp bin/ndb_mgm* /usr/local/bin \
	&& cd /usr/local/bin \
	&& chmod +x ndb_mgm* \
	&& mkdir -p /var/lib/mysql-cluster \
	&& mkdir -p /usr/local

EXPOSE 1186
ENTRYPOINT ["/usr/local/bin/ndb_mgmd","--nodaemon","--config-file=/var/lib/mysql-cluster/config.ini","--config-dir=/var/lib/mysql-cluster/","--skip-config-cache"]
