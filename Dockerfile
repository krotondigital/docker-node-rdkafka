FROM node:10-alpine

RUN apk --no-cache add \
    bash \
    g++ \
    ca-certificates \
    lz4-dev \
    musl-dev \
    cyrus-sasl-dev \
    openssl-dev \
    make \
    python

RUN apk add --no-cache --virtual \
    .build-deps \
    gcc \
    zlib-dev \
    libc-dev \
    bsd-compat-headers \
    py-setuptools \
    bash \
    git

RUN npm_config_user=root npm install node-rdkafka -g

# remove unnecessary folder with ~700M
RUN rm -rf /usr/local/lib/node_modules/node-rdkafka/.vscode

WORKDIR /opt/app

RUN npm link node-rdkafka
