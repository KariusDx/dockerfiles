FROM golang:1.7.1-alpine

ENV GOPATH=/go
ENV GOBIN=/go/bin

RUN apk update \
  && apk add git make zip g++ wget ca-certificates \
  && update-ca-certificates \
  && apk add openssl

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 && chmod +x /usr/local/bin/dumb-init

