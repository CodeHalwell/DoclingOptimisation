#!/bin/bash
cat << 'EOF'
## Project: DoclingOptimisation
CPU-optimised document conversion pipeline using IBM Docling v2.x.
Converts PDFs to structured markdown with layout detection and table extraction.

## Stack
- Python 3.14 / Docling v2.x / PyTorch (CPU-only)
- Package manager: uv (NEVER pip, poetry, or conda)
- Docker multi-stage build with pre-fetched models
- Target deployment: Azure Container App Job (consumption plan)
  - CPU profile: 4 vCPUs / 8 Gi memory
  - GPU profile: NC8as-T4 / 8 vCPUs / 56 Gi memory

## Architecture
- CLI batch processor (NOT a web service)
- Entry point: process.py — takes PDF path as arg, outputs markdown to stdout
- Auto-detects CPU count from cgroup limits (Docker/K8s)
- ThreadedStandardPdfPipeline for parallel stage execution
- All features toggleable via environment variables (DOCLING_*)

## Key Files
- process.py — main application (converter factory + CLI entrypoint)
- Dockerfile — multi-stage build with model pre-fetch
- docker-compose.yml — local dev/benchmarking
- Makefile + scripts/benchmark_threads.sh — thread benchmarking

## Coding Standards
- Type hints on all Python functions
- uv for ALL Python operations (uv run, uv add, uv sync)
- Logging to stderr via Python logging module
- Conventional commits: type(scope): description
EOF
