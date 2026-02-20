# syntax=docker/dockerfile:1
FROM python:3.14-slim-bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates gcc g++ libgl1-mesa-dev libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# uv installer version is configurable to ease updates; default should be reviewed periodically.
# Security note: For production use, verify the installer checksum before execution.
# Download the installer, compute its SHA256, and add verification:
#   RUN echo "EXPECTED_SHA256  /uv-installer.sh" | sha256sum -c -
ARG UV_INSTALLER_VERSION=0.10.4
ADD https://astral.sh/uv/${UV_INSTALLER_VERSION}/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin:$PATH"

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /build

COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv,id=uv-cache \
    uv sync --frozen --no-dev

# Pre-fetch models using the official CLI tool so they are baked into
# the image and not downloaded at runtime.
# The docling-tools command is included in the docling package.
ENV PATH="/build/.venv/bin:$PATH"
RUN docling-tools models download
# Pre-fetch the EGRET-medium layout model (faster than default Heron on CPU)
RUN python -c "from huggingface_hub import snapshot_download; snapshot_download('docling-project/docling-layout-egret-medium')"
# Pre-fetch granite-docling-258M for code/formula enrichment (258M, lightweight)
RUN python -c "from huggingface_hub import snapshot_download; snapshot_download('ibm-granite/granite-docling-258M')"
# Pre-fetch SmolVLM-256M for picture description (256M, lightweight)
RUN python -c "from huggingface_hub import snapshot_download; snapshot_download('HuggingFaceTB/SmolVLM-256M-Instruct')"
# Pre-download RapidOCR torch models using a heredoc script
# (RapidOCR defaults to onnxruntime in builder; we download torch models directly)
RUN <<'PYEOF'
python3 -c "
from pathlib import Path
import importlib.resources, urllib.request, sys

models_dir = Path(importlib.resources.files('rapidocr')) / 'models'
models_dir.mkdir(exist_ok=True)

base = 'https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.6.0/torch/PP-OCRv4'
files = [
    ('det', 'ch_PP-OCRv4_det_infer.pth'),
    ('cls', 'ch_ptocr_mobile_v2.0_cls_infer.pth'),
    ('rec', 'ch_PP-OCRv4_rec_infer.pth'),
]
for sub, name in files:
    dest = models_dir / name
    if not dest.exists():
        url = f'{base}/{sub}/{name}'
        print(f'Downloading {name} from {url}...')
        urllib.request.urlretrieve(url, dest)
        print(f'  Saved to {dest} ({dest.stat().st_size / 1024:.0f} KB)')

# Also download the rec keys file
keys_url = 'https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.6.0/torch/PP-OCRv4/rec/ppocr_keys_v1.txt'
keys_dest = models_dir / 'ppocr_keys_v1.txt'
if not keys_dest.exists():
    print('Downloading ppocr_keys_v1.txt...')
    urllib.request.urlretrieve(keys_url, keys_dest)

print('RapidOCR models pre-downloaded successfully')
"
PYEOF

# ---------------------------------------------------------------------
FROM python:3.14-slim-bookworm AS runtime

RUN groupadd -r docling && useradd -r -g docling -d /home/docling -m docling
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx libglib2.0-0 libgoogle-perftools4 && rm -rf /var/lib/apt/lists/*

COPY --from=builder --chown=docling:docling /build/.venv /home/docling/.venv
COPY --from=builder --chown=docling:docling /root/.cache /home/docling/.cache

# LD_PRELOAD tcmalloc: ~35% faster memory allocation for ML workloads.
# THP_MEM_ALLOC_ENABLE: use transparent huge pages to reduce TLB misses.
# ONEDNN_MAX_CPU_ISA: unlock Intel AMX (bfloat16 matmul) on Sapphire/Emerald Rapids.
#   Falls back gracefully to AVX-512 or AVX2 on older CPUs.
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    HF_HOME=/home/docling/.cache/huggingface \
    HF_HUB_ETAG_TIMEOUT=0 \
    HF_HUB_DOWNLOAD_TIMEOUT=5 \
    ONEDNN_MAX_CPU_ISA=AVX512_CORE_AMX \
    LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4 \
    THP_MEM_ALLOC_ENABLE=1 \
    PATH="/home/docling/.venv/bin:$PATH" \
    VIRTUAL_ENV=/home/docling/.venv

USER docling
WORKDIR /home/docling
COPY --chown=docling:docling process.py .
ENTRYPOINT ["python", "process.py"]
