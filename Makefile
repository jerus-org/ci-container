DOCKER ?= docker
INPUT_RELEASE_VERSION ?= 0.1.0
MIN_RUST_VERSION ?= 1.65.0
REPO ?= docker.io/jerusdp/ci-rust
TAG ?= $(MIN_RUST_VERSION)
BASE_TAG ?= base
WASI_TAG ?= wasi
ROLLING_TAG ?= rolling-6mo

publish: build
	$(DOCKER) push $(REPO):${TAG} 

publish-tag: build publish
	$(DOCKER) tag $(REPO):${TAG} "$(REPO):$(INPUT_RELEASE_VERSION)-min-rust-$(MIN_RUST_VERSION)"
	$(DOCKER) push "$(REPO):$(INPUT_RELEASE_VERSION)-min-rust-$(MIN_RUST_VERSION)"

build:
	$(DOCKER) build --no-cache --build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) -t $(REPO):${TAG} --target final . 2>&1 | tee build.log

build-binaries:
	$(DOCKER) build --no-cache --build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) -t $(REPO):${TAG} --target binaries . 2>&1 | tee build-binaries.log

build-base:
	$(DOCKER) build --no-cache -t $(REPO):${BASE_TAG} --target base . 2>&1 | tee build-base.log

build-wasi:
	$(DOCKER) build --no-cache --build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) -t $(REPO):${TAG}-${WASI_TAG} --target wasi . 2>&1 | tee build-wasi.log

debug: build
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):${TAG}

debug-wasi: build-wasi
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):${TAG}-${WASI_TAG} 

debug-binaries : build-binaries
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):$(TAG)

build-test: 
	$(DOCKER) build \
		--build-arg MIN_RUST_VERSION=$(MIN_RUST_VERSION) \
		-t $(REPO)/test:${TAG}-${WASI_TAG} \
		--target test . \
		2>&1 | tee build.log

test: build-test ; \
	$(DOCKER) run --rm \
		$(REPO)/test:${TAG}-${WASI_TAG}

# Rolling 6-month image targets
# Versions are calculated automatically based on current stable Rust

build-rolling:
	$(DOCKER) build --no-cache -f Dockerfile.rolling -t $(REPO):${ROLLING_TAG} --target final . 2>&1 | tee build-rolling.log

build-rolling-wasi:
	$(DOCKER) build --no-cache -f Dockerfile.rolling -t $(REPO):${ROLLING_TAG}-${WASI_TAG} --target wasi . 2>&1 | tee build-rolling-wasi.log

build-rolling-test:
	$(DOCKER) build -f Dockerfile.rolling -t $(REPO)/test:${ROLLING_TAG} --target test . 2>&1 | tee build-rolling-test.log

test-rolling: build-rolling-test ; \
	$(DOCKER) run --rm $(REPO)/test:${ROLLING_TAG}

debug-rolling: build-rolling
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):${ROLLING_TAG}

debug-rolling-wasi: build-rolling-wasi
	$(DOCKER) run --rm -it \
		--entrypoint=/bin/bash \
		$(REPO):${ROLLING_TAG}-${WASI_TAG}

publish-rolling: build-rolling
	$(DOCKER) push $(REPO):${ROLLING_TAG}

publish-rolling-wasi: build-rolling-wasi
	$(DOCKER) push $(REPO):${ROLLING_TAG}-${WASI_TAG}

publish-rolling-all: publish-rolling publish-rolling-wasi
