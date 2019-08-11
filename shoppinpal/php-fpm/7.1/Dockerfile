FROM php:7.1-fpm

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install -y \
        libicu-dev \
        libmemcached-dev \
        libpcre3-dev \
        libxml2-dev \
        zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN docker-php-source extract \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        calendar \
        intl \
        opcache \
        pdo_mysql \
        soap \
    && pecl install \
        memcached \
        oauth \
    && docker-php-ext-enable \
        memcached \
        oauth \
    && docker-php-source delete
