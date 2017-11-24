FROM redis:3.2.8

MAINTAINER liuxiangxi12@163.com

#ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-3.2.8.tar.gz
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-4.0.2.tar.gz

RUN apt update \
	&& apt install -y ruby \
	&& apt install -y ruby-redis
RUN cd ~ && wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL"
RUN	mkdir -p /usr/src/redis
RUN	cd ~ && tar -xzf redis.tar.gz -C /usr/src/redis
RUN	cd ~ && rm redis.tar.gz
#RUN cp /usr/src/redis/redis-3.2.8/src/redis-trib.rb /usr/local/bin
#RUN rm -r /usr/src/redis

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6379
#ENTRYPOINT ["redis-server"]
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]
