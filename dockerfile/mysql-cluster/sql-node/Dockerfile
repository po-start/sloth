FROM mysql:5.7  

MAINTAINER liuxiangxi12@163.com

COPY ./bin/* /usr/local/bin/
RUN apt-get update \
	&& apt-get install -y libaio-dev \
	&& apt-get install -y libnuma-dev
RUN mkdir -p /usr/local/mysql/data

ENTRYPOINT ["mysqld"]
