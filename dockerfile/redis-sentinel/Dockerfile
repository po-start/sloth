FROM redis:3.2.8

MAINTAINER liuxiangxi12@163.com

EXPOSE 26379

## 容器启动后运行
#COPY sentinel-entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/sentinel-entrypoint.sh
#ENTRYPOINT ["sentinel-entrypoint.sh"]
CMD ["redis-server","/usr/local/etc/redis/sentinel.conf","--sentinel"]
