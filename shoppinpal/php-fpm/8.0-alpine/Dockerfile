FROM php:8.0-fpm-alpine

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apk add --no-cache \
        icu \
        krb5 \
        less \
        libmemcached \
        librdkafka \
        libxml2 \
        libzip \
        openssl \
        pcre \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        gcc \
        g++ \
        make \
        icu-dev \
        krb5-dev \
        libmemcached-dev \
        librdkafka-dev \
        libxml2-dev \
        libzip-dev \
        openssl-dev \
        pcre-dev \
    && docker-php-source extract \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        calendar \
        intl \
        opcache \
        pcntl \
        pdo_mysql \
        soap \
        zip \
    && pecl install \
        memcached \
        oauth \
        rdkafka \
        redis \
    && docker-php-ext-enable \
        memcached \
        oauth \
        rdkafka \
        redis \
    && docker-php-source delete \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/*

ADD install_composer.sh /tmp/install_composer.sh
ADD php.ini /usr/local/etc/php/php.ini
ADD fpm-pool-www.conf /usr/local/etc/php-fpm.d/www.conf

RUN sh /tmp/install_composer.sh \
    && rm /tmp/install_composer.sh
