FROM redis:3.2.8

MAINTAINER liuxiangxi12@163.com

ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-3.2.8.tar.gz

RUN cd ~ && wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL"
RUN	mkdir -p /usr/src/redis
RUN	cd ~ && tar -xzf redis.tar.gz -C /usr/src/redis
RUN	cd ~ && rm redis.tar.gz
RUN cp /usr/src/redis/redis-3.2.8/src/redis-trib.rb /usr/local/bin
RUN rm -r /usr/src/redis

EXPOSE 6379
ENTRYPOINT ["redis-server"]
