FROM thinkphp:0.2.1

MAINTAINER liuxiangxi12@163.com

RUN apt update \
	&& pecl install redis \
	&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/pecl-php-ext-redis.ini

EXPOSE 9000
CMD ["php-fpm"]
