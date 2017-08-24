FROM thinkphp:0.1.2

MAINTAINER liuxiangxi12@163.com

RUN apt update \
	&& apt install uuid-dev \
	&& pecl install uuid \
	&& echo "extension=uuid.so" > /usr/local/etc/php/conf.d/pecl-php-ext-uuid.ini

EXPOSE 9000
CMD ["php-fpm"]
