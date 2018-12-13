FROM alpine:3.7

RUN apk add --update --upgrade --no-cache jq bash curl

ARG KUBERNETES_VERSION=1.11.3
RUN curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl; \
    chmod +x /usr/local/bin/kubectl

ADD assets /opt/resource
RUN chmod +x /opt/resource/*

WORKDIR /

ENTRYPOINT [ "/bin/bash" ]
