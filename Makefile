# Docker Hub image name — override with: make build-cpu IMAGE=myuser/docling
IMAGE ?= docling-optimisation
TAG   ?= latest

.PHONY: benchmark build-cpu build-gpu push-cpu push-gpu build-all

# ---------------------------------------------------------------------------
# Benchmarking (local)
# ---------------------------------------------------------------------------

benchmark:
	bash scripts/benchmark_threads.sh

# ---------------------------------------------------------------------------
# Azure CPU build (4 vCPUs, 8 Gi, x86-64)
# ---------------------------------------------------------------------------

build-cpu:
	DOCKER_BUILDKIT=1 docker build \
		--platform linux/amd64 \
		-f Dockerfile.cpu \
		-t $(IMAGE):cpu-$(TAG) \
		.

push-cpu: build-cpu
	docker push $(IMAGE):cpu-$(TAG)

# ---------------------------------------------------------------------------
# Azure GPU build (NC8as-T4, 8 vCPUs, 56 Gi, NVIDIA T4)
# ---------------------------------------------------------------------------

build-gpu:
	DOCKER_BUILDKIT=1 docker build \
		--platform linux/amd64 \
		-f Dockerfile.gpu \
		-t $(IMAGE):gpu-$(TAG) \
		.

push-gpu: build-gpu
	docker push $(IMAGE):gpu-$(TAG)

# ---------------------------------------------------------------------------
# Build both
# ---------------------------------------------------------------------------

build-all: build-cpu build-gpu
