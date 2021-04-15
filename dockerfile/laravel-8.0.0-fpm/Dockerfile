FROM php:8.0.0-fpm  

MAINTAINER liuxiangxi12@163.com

# laravel 8.0
#RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list

#ENV EXT_AMQP_VERSION=master

RUN apt-get update \
    && apt-get install -y libssl-dev unzip librabbitmq-dev net-tools wget \
	&& apt-get install -y libxrender1 libfontconfig1 libx11-dev libjpeg62 libxtst6 \
	&& apt-get install -y libpq-dev libicu-dev \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install sockets\
    && docker-php-ext-install intl \
#    && pecl install amqp \
#	&& docker-php-ext-enable amqp \ 
    && pecl install mongodb \
	&& docker-php-ext-enable mongodb

#RUN docker-php-source extract \
#    && apk -Uu add git rabbitmq-c-dev \
#    && git clone --branch $EXT_AMQP_VERSION --depth 1 https://github.com/php-amqp/php-amqp.git /usr/src/php/ext/amqp \
#    && cd /usr/src/php/ext/amqp && git submodule update --init \
#    && docker-php-ext-install amqp

RUN apt-get install -y uuid-dev \
    && pecl install uuid \
	&& docker-php-ext-enable uuid

RUN pecl install redis \
	&& docker-php-ext-enable redis \
    && apt-get install -y libzip-dev \
    && pecl install zip \
	&& docker-php-ext-enable zip

#RUN pecl install grpc
#RUN pecl install protobuf 

# 目前GRPC不支持8.0.0
#RUN mkdir -p /tmp/protoc \
#    && curl -L https://github.com/google/protobuf/releases/download/v3.14.0/protoc-3.14.0-linux-x86_64.zip > /tmp/protoc/protoc.zip \
#    && cd /tmp/protoc \
#    && unzip protoc.zip \
#    && cp /tmp/protoc/bin/protoc /usr/bin \
#    && cd /tmp \
#    && rm -r /tmp/protoc \
#	&& docker-php-ext-enable grpc \
#	&& docker-php-ext-enable protobuf 

RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev \
#	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# 清理apt
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000
CMD ["php-fpm"]
