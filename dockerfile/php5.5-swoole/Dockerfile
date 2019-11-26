FROM php:5.5-cli

MAINTAINER liuxiangxi12@163.com

#ADD sources.list /etc/apt/

RUN apt update \
	&& apt install -y rsyslog

RUN pecl install swoole-1.8.5 \
	&& docker-php-ext-enable swoole \
	&& docker-php-ext-install mysql \ 
	&& docker-php-ext-install mysqli 

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "-c", "/usr/bin/entrypoint.sh"]
