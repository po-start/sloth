FROM php:7.1.4-cli  

MAINTAINER liuxiangxi12@163.com

RUN echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" > /etc/apt/sources.list \
	&& echo "deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list \
	# && echo "deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list \
	# && echo "deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y libpcre3-dev net-tools \
	&& apt-get install -y libssl-dev unzip librabbitmq-dev \
	&& apt-get install -y libpq-dev libicu-dev wget \
	&& docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install sockets

RUN pecl channel-update pecl.php.net \
	&& pecl install swoole-1.9.3 \
	&& docker-php-ext-enable swoole

RUN apt-get install -y uuid-dev \
    && pecl install uuid \
	&& docker-php-ext-enable uuid

RUN pecl install redis \
	&& docker-php-ext-enable redis \
    && apt-get install -y libzip-dev \
    && pecl install zip \
	&& docker-php-ext-enable zip

RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# 清理apt
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
