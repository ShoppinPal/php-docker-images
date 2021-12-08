#!/bin/sh

set -e

docker pull alpine:latest
docker pull ubuntu:xenial
docker pull mysql:5.7
docker pull php:7.1-fpm
docker pull php:7.2-fpm
docker pull php:7.3-fpm
docker pull php:7.4-fpm
docker pull php:8.0-fpm
docker pull php:8.0-fpm-alpine
docker pull swaggerapi/swagger-codegen-cli-v3:3.0.20
docker pull bitnami/fluentd:1.12.3-debian-10-r4

docker build -t shoppinpal/git-ssh shoppinpal/git-ssh

docker build -t shoppinpal/mysql-tmpfs:5.7 shoppinpal/mysql-tmpfs/5.7
docker tag shoppinpal/mysql-tmpfs:5.7 shoppinpal/mysql-tmpfs:latest

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

docker build -t shoppinpal/php-fpm:8.0-alpine shoppinpal/php-fpm/8.0-alpine
docker build -t shoppinpal/php-fpm-dev:8.0-alpine shoppinpal/php-fpm-dev/8.0-alpine
docker build -t shoppinpal/php-ci:8.0-alpine shoppinpal/php-ci/8.0-alpine

docker build -t shoppinpal/nginx-php-ci shoppinpal/nginx-php-ci

docker build -t shoppinpal/swagger-codegen shoppinpal/swagger-codegen

docker build -t shoppinpal/fluentd:1.12.3-debian-10-r4 shoppinpal/fluentd/1.12.3-debian-10-r4
docker tag shoppinpal/fluentd:1.12.3-debian-10-r4 shoppinpal/fluentd:latest

docker build -t shoppinpal/kubectl-kustomize shoppinpal/kubectl-kustomize

docker push shoppinpal/mysql-tmpfs

docker push shoppinpal/php-fpm:7.3
docker push shoppinpal/php-fpm:7.4
docker push shoppinpal/php-fpm:8.0
docker push shoppinpal/php-fpm:8.0-alpine
docker push shoppinpal/php-fpm-azure:7.3
docker push shoppinpal/php-fpm-azure:7.4
docker push shoppinpal/php-fpm-azure:8.0
docker push shoppinpal/php-fpm-dev:7.3
docker push shoppinpal/php-fpm-dev:7.4
docker push shoppinpal/php-fpm-dev:8.0
docker push shoppinpal/php-fpm-dev:8.0-alpine
docker push shoppinpal/php-ci:7.3
docker push shoppinpal/php-ci:7.4
docker push shoppinpal/php-ci:8.0
docker push shoppinpal/php-ci:8.0-alpine

docker push shoppinpal/git-ssh
docker push shoppinpal/nginx-php-ci

docker push shoppinpal/swagger-codegen

docker push shoppinpal/fluentd:latest
docker push shoppinpal/fluentd:1.12.3-debian-10-r4

docker push shoppinpal/kubectl-kustomize
