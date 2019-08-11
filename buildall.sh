#!/bin/sh
docker pull ubuntu:xenial
docker pull php:7.1-fpm
docker pull php:7.2-fpm
docker pull php:7.3-fpm

docker build -t shoppinpal/git-ssh shoppinpal/git-ssh

docker build -t shoppinpal/php-fpm:7.1 shoppinpal/php-fpm/7.1
docker build -t shoppinpal/php-fpm-dev:7.1 shoppinpal/php-fpm-dev/7.1
docker build -t shoppinpal/php-ci:7.1 shoppinpal/php-ci/7.1

docker build -t shoppinpal/php-fpm:7.2 shoppinpal/php-fpm/7.2
docker build -t shoppinpal/php-fpm-dev:7.2 shoppinpal/php-fpm-dev/7.2
docker build -t shoppinpal/php-ci:7.2 shoppinpal/php-ci/7.2

docker build -t shoppinpal/php-fpm:7.3 shoppinpal/php-fpm/7.3
docker build -t shoppinpal/php-fpm-dev:7.3 shoppinpal/php-fpm-dev/7.3
docker build -t shoppinpal/php-ci:7.3 shoppinpal/php-ci/7.3

docker build -t shoppinpal/nginx-php-ci shoppinpal/nginx-php-ci

# Deprecated images
docker build -t shoppinpal/php-base shoppinpal/php-base
docker build -t shoppinpal/php-base-fpm shoppinpal/php-base-fpm
docker build -t shoppinpal/php-soap-base shoppinpal/php-soap-base
docker build -t shoppinpal/php-soap-base-fpm shoppinpal/php-soap-base-fpm

docker push shoppinpal/php-fpm
docker push shoppinpal/php-fpm-dev
docker push shoppinpal/php-ci

docker push shoppinpal/git-ssh
docker push shoppinpal/nginx-php-ci

# Deprecated images
docker push shoppinpal/php-base
docker push shoppinpal/php-base-fpm
docker push shoppinpal/php-soap-base
docker push shoppinpal/php-soap-base-fpm
