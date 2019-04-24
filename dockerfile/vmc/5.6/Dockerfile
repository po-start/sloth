FROM php:5.6.15-fpm

MAINTAINER liuxiangxi12@163.com

ADD sources.list /etc/apt/

RUN apt-get update \
	&& apt-get install -y wget libssl-dev unzip libmcrypt-dev \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && pecl install mongodb \
	&& docker-php-ext-enable mongodb

RUN apt-get install -y uuid-dev \
    && pecl install uuid \
	&& docker-php-ext-enable uuid

RUN docker-php-ext-install mbstring \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install mcrypt 

RUN apt-get install -y libmemcached-dev zlib1g-dev \
	&& pecl install memcached-2.1.0	\
	&& docker-php-ext-enable memcached

RUN pecl install redis \
	&& docker-php-ext-enable redis \
    && apt-get install -y libzip-dev \
    && pecl install zip \
	&& docker-php-ext-enable zip

RUN apt-get install -y libpng12-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN cd /tmp \
	&& wget -L http://downloads.zend.com/guard/7.0.0/zend-loader-php5.6-linux-x86_64_update1.tar.gz \
	&& tar -xzf zend-loader-php5.6-linux-x86_64_update1.tar.gz \
	&& cp /tmp/zend-loader-php5.6-linux-x86_64/*.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226 \
	&& rm -rf /tmp/* \
	&& docker-php-ext-enable ZendGuardLoader 

# 清理apt
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000
CMD ["php-fpm"]
