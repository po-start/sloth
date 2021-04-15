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


#########################################

##https://github.com/swoole/swoole-src/releases/tag/v4.5.2


FROM php:latest

MAINTAINER twosee <twose@qq.com>

# install modules : GD iconv
RUN apt-get update && apt-get install -y \
        procps \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        openssl \
        libssh-dev \
        libpcre3 \
        libpcre3-dev \
        libnghttp2-dev \
        libhiredis-dev \
        curl \
        wget \
        zip \
        unzip \
        git && \
        apt autoremove && apt clean

# install php pdo_mysql opcache
# WARNING: Disable opcache-cli if you run you php
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install \
    iconv \
    gd \
    pdo_mysql \
    mysqli \
    iconv \
    mbstring \
    json \
    opcache \
    sockets \
    pcntl && \
    echo "opcache.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

#install redis
RUN pecl install redis && docker-php-ext-enable redis

# install composer
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update --clean-backups

# install swoole
#TIP: it always get last stable version of swoole coroutine.
RUN cd /root && \
    curl -o /tmp/swoole-releases https://github.com/swoole/swoole-src/releases -L && \
    cat /tmp/swoole-releases | grep 'href=".*archive.*.tar.gz"' | head -1 | \
    awk -F '"' ' {print "curl -o /tmp/swoole.tar.gz https://github.com"$2" -L" > "/tmp/swoole.download"}' && \
    sh /tmp/swoole.download && \
    tar zxvf /tmp/swoole.tar.gz && cd swoole-src* && \
    phpize && \
    ./configure \
    --enable-coroutine \
    --enable-openssl  \
    --enable-http2  \
    --enable-async-redis \
    --enable-mysqlnd && \
    make && make install && \
    docker-php-ext-enable swoole && \
    echo "swoole.fast_serialize=On" >> /usr/local/etc/php/conf.d/docker-php-ext-swoole-serialize.ini && \
    rm -rf /tmp/*

# set China timezone
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone && \
    echo "[Date]\ndate.timezone=Asia/Shanghai" > /usr/local/etc/php/conf.d/timezone.ini
