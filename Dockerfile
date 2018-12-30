FROM golang:1.11.4-stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils gcc libsasl2-dev lib32z1-dev libldap2-dev libssl-dev openssl \
    software-properties-common ca-certificates build-essential systemd \
    apt-transport-https git python libglib2.0-dev \
    curl gnupg2 wget git zip unzip libcurl3-openssl-dev

RUN apt-get install -y python-pip && pip install awscli

RUN \
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
	apt-get update -y && \
	apt-get install docker-ce -y && \
	systemctl enable docker

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter \
    && chmod +x /usr/local/bin/cc-test-reporter

RUN \
	go get -u github.com/rubenv/sql-migrate/...
