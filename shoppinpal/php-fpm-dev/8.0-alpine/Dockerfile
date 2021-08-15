FROM shoppinpal/php-fpm:8.0-alpine

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apk add --no-cache \
    bash \
    binutils \
    git \
    gnupg \
    grep \
    mysql-client \
    netcat-openbsd \
    openssh-client \
    procps \
    python2 \
    unzip

RUN apk add --no-cache --virtual \
        .build-deps \
        autoconf \
        gcc \
        g++ \
        make \
    && docker-php-source extract \
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    && docker-php-source delete \
    && mkdir -p /tmp/phpspy \
        && cd /tmp/phpspy \
        && git clone https://github.com/adsr/phpspy.git . \
        && make \
        && mv /tmp/phpspy/phpspy /usr/local/bin/phpspy \
        && rm -rf /tmp/phpspy \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/*

RUN echo "xdebug.client_host = 10.254.254.254" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.discover_client_host = false" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port = 9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.max_nesting_level = 512" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode = coverage,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ADD wait_for_port.sh /usr/local/bin/wait_for_port.sh

RUN chmod +x /usr/local/bin/wait_for_port.sh
