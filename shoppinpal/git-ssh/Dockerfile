FROM alpine

MAINTAINER Zsolt Szeberenyi <zsolt@szeberenyi.com>

ENV KUBE_LATEST_VERSION=v1.13.1

RUN apk add --no-cache git openssh-client bash \
  && apk add --no-cache --update -t deps curl  \
  && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && apk del --purge deps

