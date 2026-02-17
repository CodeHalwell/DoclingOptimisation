# syntax=docker/dockerfile:1
FROM python:3.12-slim-bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates gcc g++ libgl1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

ADD https://astral.sh/uv/0.6.0/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin:$PATH"

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /build

COPY requirements.txt .

# NOTE: --no-cache-dir is intentionally omitted because the BuildKit
# cache mount below handles caching correctly. Using both would be
# contradictory — the mount provides cross-build caching while
# --no-cache-dir would disable it.
RUN --mount=type=cache,target=/root/.cache/uv,id=uv-cache \
    uv pip install --system -r requirements.txt

# Pre-fetch models using the official CLI tool so they are baked into
# the image and not downloaded at runtime.
RUN docling-tools models download

# ---------------------------------------------------------------------
FROM python:3.12-slim-bookworm AS runtime

RUN groupadd -r docling && useradd -r -g docling -d /home/docling -m docling
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx libglib2.0-0 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/lib/python3.12/site-packages \
     /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /root/.cache /home/docling/.cache

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    HF_HOME=/home/docling/.cache/huggingface

RUN chown -R docling:docling /home/docling
USER docling
WORKDIR /home/docling
COPY --chown=docling:docling process.py .
ENTRYPOINT ["python", "process.py"]
