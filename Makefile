DOCKER ?= docker
REPO   ?= docker.io/jerusdp/ci-rust
ROLLING_TAG ?= rolling-6mo
WASI_TAG    ?= wasi

build:
	$(DOCKER) build -t $(REPO):$(ROLLING_TAG) --target final . 2>&1 | tee build.log

build-wasi:
	$(DOCKER) build -t $(REPO):$(ROLLING_TAG)-$(WASI_TAG) --target wasi . 2>&1 | tee build-wasi.log

build-base:
	$(DOCKER) build -t $(REPO):base --target base . 2>&1 | tee build-base.log

build-test:
	$(DOCKER) build -t $(REPO)/test:$(ROLLING_TAG) --target test . 2>&1 | tee build-test.log

test: build-test
	$(DOCKER) run --rm $(REPO)/test:$(ROLLING_TAG)

debug:
	$(DOCKER) run --rm -it --entrypoint=/bin/bash $(REPO):$(ROLLING_TAG)

debug-wasi:
	$(DOCKER) run --rm -it --entrypoint=/bin/bash $(REPO):$(ROLLING_TAG)-$(WASI_TAG)

debug-base:
	$(DOCKER) run --rm -it --entrypoint=/bin/bash $(REPO):base

publish: build
	$(DOCKER) push $(REPO):$(ROLLING_TAG)

publish-wasi: build-wasi
	$(DOCKER) push $(REPO):$(ROLLING_TAG)-$(WASI_TAG)

publish-base: build-base
	$(DOCKER) push $(REPO):base

publish-all: publish publish-wasi publish-base
