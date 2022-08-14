# ci-container

Provide a container for running CircleCI jobs.

## Configuration Files

### Dockerfile

The Dockerfile builds a container based on CircleCI's cimg/rust which contains the latest (in the available image) rust compiler.

To this we add:

- rust stable, beta, and nightly compilers
- rust minimum compiler as specified by MIN_RUST_VERSION
- cargo release & nextsv binaries used in our CircleCI configs

### Makefile

The Makefile builds, tags and publishes the container image to the container repository. The image is tagged with the MIN_RUST_VERSION requested.

## Usage

### Generating container images

Use make to build and publish an image to the repo.

```sh
MIN_RUST_VERSION=1.49.0 make publish-tag
```

If the MIN_RUST_VERSION is not specified the default is 1.56.0.

### Usage in CircleCI

Specify the repo, image and tag for the required minimum rust version at the top of the CircleCI config.

```yml
version: 2.1

executors:
  rust-env:
    docker:
      - image: cimg/rust:1.62
```
