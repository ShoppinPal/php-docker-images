#!/bin/sh

set -e

docker pull ubuntu:xenial
docker pull mysql:5.7
docker pull php:7.1-fpm
docker pull php:7.2-fpm
docker pull php:7.3-fpm
docker pull php:7.4-fpm
docker pull php:8.0-fpm
docker pull swaggerapi/swagger-codegen-cli-v3:3.0.20

docker build -t shoppinpal/git-ssh shoppinpal/git-ssh

docker build -t shoppinpal/mysql-tmpfs:5.7 shoppinpal/mysql-tmpfs/5.7
docker tag shoppinpal/mysql-tmpfs:5.7 shoppinpal/mysql-tmpfs:latest

docker build -t shoppinpal/php-fpm:7.1 shoppinpal/php-fpm/7.1
docker build -t shoppinpal/php-fpm-dev:7.1 shoppinpal/php-fpm-dev/7.1
docker build -t shoppinpal/php-ci:7.1 shoppinpal/php-ci/7.1

docker build -t shoppinpal/php-fpm:7.2 shoppinpal/php-fpm/7.2
docker build -t shoppinpal/php-fpm-dev:7.2 shoppinpal/php-fpm-dev/7.2
docker build -t shoppinpal/php-ci:7.2 shoppinpal/php-ci/7.2

docker build -t shoppinpal/php-fpm:7.3 shoppinpal/php-fpm/7.3
docker build -t shoppinpal/php-fpm-azure:7.3 shoppinpal/php-fpm-azure/7.3
docker build -t shoppinpal/php-fpm-dev:7.3 shoppinpal/php-fpm-dev/7.3
docker build -t shoppinpal/php-ci:7.3 shoppinpal/php-ci/7.3

docker build -t shoppinpal/php-fpm:7.4 shoppinpal/php-fpm/7.4
docker build -t shoppinpal/php-fpm-azure:7.4 shoppinpal/php-fpm-azure/7.4
docker build -t shoppinpal/php-fpm-dev:7.4 shoppinpal/php-fpm-dev/7.4
docker build -t shoppinpal/php-ci:7.4 shoppinpal/php-ci/7.4

docker build -t shoppinpal/php-fpm:8.0 shoppinpal/php-fpm/8.0
docker build -t shoppinpal/php-fpm-azure:8.0 shoppinpal/php-fpm-azure/8.0
docker build -t shoppinpal/php-fpm-dev:8.0 shoppinpal/php-fpm-dev/8.0
docker build -t shoppinpal/php-ci:8.0 shoppinpal/php-ci/8.0

docker build -t shoppinpal/nginx-php-ci shoppinpal/nginx-php-ci

docker build -t shoppinpal/swagger-codegen shoppinpal/swagger-codegen

# Deprecated images
docker build -t shoppinpal/php-base shoppinpal/php-base
docker build -t shoppinpal/php-base-fpm shoppinpal/php-base-fpm
docker build -t shoppinpal/php-soap-base shoppinpal/php-soap-base
docker build -t shoppinpal/php-soap-base-fpm shoppinpal/php-soap-base-fpm

docker push shoppinpal/mysql-tmpfs

docker push shoppinpal/php-fpm
docker push shoppinpal/php-fpm-azure
docker push shoppinpal/php-fpm-dev
docker push shoppinpal/php-ci

docker push shoppinpal/git-ssh
docker push shoppinpal/nginx-php-ci

docker push shoppinpal/swagger-codegen

# Deprecated images
docker push shoppinpal/php-base
docker push shoppinpal/php-base-fpm
docker push shoppinpal/php-soap-base
docker push shoppinpal/php-soap-base-fpm
