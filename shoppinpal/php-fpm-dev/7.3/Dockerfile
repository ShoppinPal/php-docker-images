FROM shoppinpal/php-fpm:7.3

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install -y \
        git \
        gnupg2 \
        mariadb-client \
        netcat-openbsd \
        openssh-client \
        python \
        unzip \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN docker-php-source extract \
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    && docker-php-source delete \
    && echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host = 10.254.254.254" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port = 9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.max_nesting_level = 512" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode = coverage,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN mkdir -p /tmp/phpspy \
    && cd /tmp/phpspy \
    && git clone https://github.com/adsr/phpspy.git . \
    && make \
    && mv /tmp/phpspy/phpspy /usr/local/bin/phpspy \
    && rm -rf /tmp/phpspy
