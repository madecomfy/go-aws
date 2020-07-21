# Go AWS

[![CircleCI](https://circleci.com/gh/madecomfy/go-aws.svg?style=svg)](https://circleci.com/gh/madecomfy/go-aws)
[![](https://images.microbadger.com/badges/image/madecomfyau/go-aws.svg)](https://microbadger.com/images/madecomfyau/go-aws)
[![Maintainability](https://api.codeclimate.com/v1/badges/0b57813ffacd093b71ec/maintainability)](https://codeclimate.com/github/madecomfy/go-aws/maintainability)

An Alpine Go container preloaded with AWS tooling for CI builds.

## Usage

```bash
docker pull madecomfyau/go-aws
```

```bash
docker pull madecomfyau/go-aws:1.14
```

## CircleCI configuration example

```yaml
version: 2

defaults: &defaults
  working_directory: /go/src/github.com/madecomfy/xxxxxx
  docker:
    - image: madecomfyau/go-aws:1.14
```

## References

- [Official Go Alpine](https://hub.docker.com/_/golang)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Dockerhub](https://hub.docker.com/r/madecomfyau/go-aws)
