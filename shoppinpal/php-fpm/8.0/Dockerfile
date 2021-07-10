FROM php:8.0-fpm

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install -y \
        libicu-dev \
        libmemcached-dev \
        libpcre3-dev \
        librdkafka-dev \
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
        rdkafka \
        redis \
    && docker-php-ext-enable \
        memcached \
        oauth \
        rdkafka \
        redis \
    && docker-php-source delete

ADD install_composer.sh /tmp/install_composer.sh

RUN sh /tmp/install_composer.sh \
    && rm /tmp/install_composer.sh
