FROM shoppinpal/php-fpm:8.0

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN docker-php-source extract \
    && pecl install \
        mysqlnd_azure \
    && docker-php-ext-enable \
        mysqlnd_azure \
    && docker-php-source delete \
    && mkdir -p /etc/ssl/mysql

ADD BaltimoreCyberTrustRoot.crt.pem /etc/ssl/mysql/BaltimoreCyberTrustRoot.crt.pem
