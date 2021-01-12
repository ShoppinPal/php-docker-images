FROM shoppinpal/php-fpm:7.3

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN docker-php-source extract \
    && pecl install \
        mysqlnd_azure \
    && docker-php-ext-enable \
        mysqlnd_azure \
    && docker-php-source delete
