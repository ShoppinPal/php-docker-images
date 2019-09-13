FROM shoppinpal/php-fpm-dev:7.3

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install -y \
        apt-transport-https \
        nginx \
        openssl \
        software-properties-common \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN rm /etc/nginx/sites-enabled/*

COPY ./supervisor/*.conf /etc/supervisor/conf.d/
COPY wait_for_port.sh /usr/local/bin/wait_for_port.sh

RUN chmod +x /usr/local/bin/wait_for_port.sh

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
