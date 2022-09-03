DOCKER ?= docker
INPUT_RELEASE_VERSION ?= 0.1.0
MIN_RUST_VERSION ?= 1.56.0
REPO ?= jerusdp/ci-rust
TAG ?= $(MIN_RUST_VERSION)

publish: build
	$(DOCKER) push $(REPO):${TAG} 

publish-tag: build publish
	$(DOCKER) tag $(REPO):${TAG} "$(REPO):$(INPUT_RELEASE_VERSION)-min-rust-$(MIN_RUST_VERSION)"
	$(DOCKER) push "$(REPO):$(INPUT_RELEASE_VERSION)-min-rust-$(MIN_RUST_VERSION)"

build:
	$(DOCKER) build --build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) -t $(REPO):${TAG} --target final .

debug: build
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):$(TAG)

build-test: 
	$(DOCKER) build --build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) -t $(REPO)/test:${TAG} --target test .

test: build-test
	$(DOCKER) run --rm \
		$(REPO)/test:$(TAG)
		