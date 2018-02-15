FROM golang:alpine

RUN \
	apk -Uuv add groff less python py-pip git zip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*
