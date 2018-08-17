FROM golang:1.10-alpine

RUN \
	apk -Uuv add --no-cache build-base groff less python py-pip git curl openssl zip && \
	pip install --upgrade pip && \
	pip install awscli --upgrade && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN \
	go get -u github.com/rubenv/sql-migrate/...
