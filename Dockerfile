FROM golang:1.10-alpine

RUN \
	apk -Uuv add --no-cache build-base groff less python py-pip git curl zip && \
	pip install --upgrade pip && \
	pip install awscli --upgrade && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

RUN \
	go get -u github.com/rubenv/sql-migrate/...
