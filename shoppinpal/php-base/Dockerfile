FROM ubuntu:xenial

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN echo "apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*" > /usr/local/sbin/repocleanup.sh \
    && chmod o+x /usr/local/sbin/repocleanup.sh

# Add ondrej/php PPA, PHP, composer and selected extensions
RUN apt-get update \
    && apt-get -y --no-install-recommends install software-properties-common python-software-properties \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get -y --no-install-recommends install curl git unzip php7.1-cli php7.1-fpm php7.1-apcu php7.1-apcu-bc\
        php7.1-curl php7.1-json php7.1-mcrypt php7.1-opcache php7.1-readline php7.1-xdebug php7.1-mysql\
        php7.1-memcached php7.1-xml mysql-client\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && /usr/local/sbin/repocleanup.sh

RUN sed -i "/listen = .*/c\listen = [::]:9000" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "/;clear_env = .*/c\clear_env = no" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "/pid = .*/c\;pid = /run/php/php7.1-fpm.pid" /etc/php/7.1/fpm/php-fpm.conf \
    && sed -i "/;daemonize = .*/c\daemonize = no" /etc/php/7.1/fpm/php-fpm.conf \
    && sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php/7.1/fpm/php-fpm.conf \
    && usermod -u 1000 www-data
