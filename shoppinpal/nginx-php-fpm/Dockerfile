FROM debian:stretch-slim

ENV NGINX_VERSION 1.12.0-1~stretch
ENV NJS_VERSION   1.12.0.0.1.10-1~stretch

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y gnupg1 \
	&& \
	NGINX_GPGKEY=573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62; \
	found=''; \
	for server in \
		ha.pool.sks-keyservers.net \
		hkp://keyserver.ubuntu.com:80 \
		hkp://p80.pool.sks-keyservers.net:80 \
		pgp.mit.edu \
	; do \
		echo "Fetching GPG key $NGINX_GPGKEY from $server"; \
		apt-key adv --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break; \
	done; \
	test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1; \
	apt-get remove --purge -y gnupg1 && apt-get -y --purge autoremove && rm -rf /var/lib/apt/lists/* \
	&& echo "deb http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt=${NGINX_VERSION} \
						nginx-module-geoip=${NGINX_VERSION} \
						nginx-module-image-filter=${NGINX_VERSION} \
						nginx-module-njs=${NJS_VERSION} \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

ADD conf/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

RUN echo "apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*" > /usr/local/sbin/repocleanup.sh \
    && chmod o+x /usr/local/sbin/repocleanup.sh

# Add ondrej/php PPA, PHP, composer and selected extensions
RUN apt-get update \
    && apt-get -y --no-install-recommends install apt-transport-https lsb-release ca-certificates wget supervisor \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get -y --no-install-recommends install curl git unzip php7.1-cli php7.1-fpm php7.1-apcu php7.1-apcu-bc\
        php7.1-curl php7.1-json php7.1-mcrypt php7.1-opcache php7.1-readline php7.1-mysql\
        php7.1-memcached php7.1-mbstring php7.1-xml mysql-client netcat-openbsd\
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

RUN curl -sS http://robo.li/robo.phar -o /usr/local/bin/robo \
    && chmod +x /usr/local/bin/robo

ADD conf/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
