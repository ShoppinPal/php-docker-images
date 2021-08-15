FROM shoppinpal/php-fpm-dev:8.0-alpine

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apk add --no-cache \
        nginx \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN rm /etc/nginx/sites-enabled/* \
    && ln -s /etc/nginx/conf.d /etc/nginx/sites-enabled

ADD ./supervisor/*.conf /etc/supervisor/conf.d/

RUN chmod +x /usr/local/bin/wait_for_port.sh

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
