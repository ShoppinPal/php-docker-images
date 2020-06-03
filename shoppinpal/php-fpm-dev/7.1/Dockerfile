FROM shoppinpal/php-fpm:7.1

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install -y \
        git \
        gnupg2 \
        mariadb-client \
        netcat-openbsd \
        openssh-client \
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
    && echo "xdebug.overload_var_dump = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
