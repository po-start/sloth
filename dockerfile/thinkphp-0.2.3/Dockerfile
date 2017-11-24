FROM php:7.1.2-fpm

MAINTAINER liuxiangxi12@163.com

# think 0.1.2
RUN apt-get update \
    && apt-get install -y libssl-dev \
    && /usr/local/bin/docker-php-ext-install mysqli \
    && /usr/local/bin/docker-php-ext-install pdo_mysql \
    && pecl install mongodb \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/pecl-php-ext-mongodb.ini

#think 0.2.1
RUN apt-get install uuid-dev \
    && pecl install uuid \
    && echo "extension=uuid.so" > /usr/local/etc/php/conf.d/pecl-php-ext-uuid.ini

#think 0.2.3
RUN pecl install redis \
	&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/pecl-php-ext-redis.ini \
	&& apt-get install -y libzip-dev \
	&& pecl install zip \
	&& echo "extension=zip.so" > /usr/local/etc/php/conf.d/pecl-php-ext-zip.ini

EXPOSE 9000
CMD ["php-fpm"]
