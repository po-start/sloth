FROM php:7.1.2-fpm

MAINTAINER liuxiangxi12@163.com

RUN apt-get update \
	&& apt-get install -y libssl-dev \
	&& /usr/local/bin/docker-php-ext-install mysqli \
	&& /usr/local/bin/docker-php-ext-install pdo_mysql \
	&& pecl install mongodb \
	&& echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/pecl-php-ext-mongodb.ini

EXPOSE 9000
CMD ["php-fpm"]
