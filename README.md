# go-aws

A Go AWS container for CI builds.

To use:

```bash
docker pull madecomfyau/go-aws
```

In a circle CI config:

```yaml
version: 2

defaults: &defaults
  working_directory: /go/src/github.com/madecomfy/xxxxxx
  docker:
    - image: madecomfyau/go-aws:1.12
```
