FROM shoppinpal/php-base

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

RUN apt-get update \
    && apt-get install --no-install-recommends -y php-soap \
    && /usr/local/sbin/repocleanup.sh
