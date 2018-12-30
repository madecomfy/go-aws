FROM golang:1.11.4-stretch

RUN \
	apk -Uuv add --no-cache build-base openrc groff less python py-pip git curl openssl zip && \
	pip install --upgrade pip && \
	pip install awscli --upgrade && \
	apk --purge -v del py-pip && \
	echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
	apk update && \
	rm -Rf /var/cache/apk/*


RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils gcc libsasl2-dev lib32z1-dev libldap2-dev libssl-dev openssl \
    python-software-properties software-properties-common build-essential \
    apt-transport-https git python libglib2.0-dev \
    curl wget git zip unzip libcurl3-openssl-dev

RUN apt-get install -y python-pip && pip install awscli

RUN \
	apt-get install apt-transport-https dirmngr && \
	echo 'deb https://apt.dockerproject.org/repo debian-stretch main' >> /etc/apt/sources.list && \
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys F76221572C52609D && \
	apt-get update && \
	apt-get install docker-engine

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter \
    && chmod +x /usr/local/bin/cc-test-reporter

RUN \
	go get -u github.com/rubenv/sql-migrate/...
