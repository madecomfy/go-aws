FROM golang:alpine

RUN \
	apk -Uuv add --no-cache groff less python py-pip git zip && \
	pip install awscli --upgrade && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*
