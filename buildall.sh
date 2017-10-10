#!/bin/sh
docker build -t shoppinpal/php-base shoppinpal/php-base
docker build -t shoppinpal/php-base-fpm shoppinpal/php-base-fpm
docker build -t shoppinpal/php-soap-base shoppinpal/php-soap-base
docker build -t shoppinpal/php-soap-base-fpm shoppinpal/php-soap-base-fpm
docker build -t shoppinpal/nginx-php-ci shoppinpal/nginx-php-ci
