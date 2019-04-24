FROM php:7.3.4-fpm  

MAINTAINER liuxiangxi12@163.com

# laravel 0.1.2
RUN apt-get update \
    && apt-get install -y libssl-dev unzip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install bcmath \
    && pecl install mongodb \
	&& docker-php-ext-enable mongodb

RUN apt-get install -y uuid-dev \
    && pecl install uuid \
	&& docker-php-ext-enable uuid

RUN pecl install redis \
	&& docker-php-ext-enable redis \
    && apt-get install -y libzip-dev \
    && pecl install zip \
	&& docker-php-ext-enable zip

RUN pecl install grpc

RUN mkdir -p /tmp/protoc \
    && curl -L https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip > /tmp/protoc/protoc.zip \
    && cd /tmp/protoc \
    && unzip protoc.zip \
    && cp /tmp/protoc/bin/protoc /usr/bin \
    && cd /tmp \
    && rm -r /tmp/protoc \
	&& docker-php-ext-enable grpc

RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# 清理apt
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000
CMD ["php-fpm"]
