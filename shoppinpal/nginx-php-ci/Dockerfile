FROM shoppinpal/nginx-php

RUN apt-get update \
    && apt-get install php7.1-xdebug \
    && repocleanup.sh

COPY wait_for_port.sh /usr/local/bin/wait_for_port.sh

RUN chmod +x /usr/local/bin/wait_for_port.sh