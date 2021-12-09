FROM alpine:latest

RUN apk add --no-cache --virtual .deps curl bash && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod 755 kubectl && \
    mv kubectl /usr/bin/kubectl && \
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
    mv kustomize /usr/bin/kustomize && \
    apk del .deps
