# DoclingOptimisation

CPU-optimised document conversion pipeline using IBM Docling v2.x. Converts PDFs to structured markdown with AI-driven layout detection, table extraction, and optional OCR.

## Architecture

This is a **CLI batch processor**, not a web service. The container starts, processes one PDF, outputs markdown to stdout, and exits.

- **Entry point:** `process.py` — takes a PDF path as a positional argument
- **Pipeline:** `ThreadedStandardPdfPipeline` for parallel stage execution across page batches
- **CPU detection:** Auto-detects from cgroup v2/v1 limits (Docker/K8s), macOS sysctl, or `os.cpu_count()`
- **All features toggleable** via `DOCLING_*` environment variables

### Key Files

| File | Purpose |
|------|---------|
| `process.py` | Main application — converter factory, CPU detection, CLI entrypoint |
| `Dockerfile` | Multi-stage build (builder + runtime), pre-fetches all models |
| `docker-compose.yml` | Local dev/benchmarking with resource limits |
| `pyproject.toml` | uv project definition, CPU-only PyTorch index |
| `Makefile` | Thread benchmarking (`make benchmark`) |
| `scripts/benchmark_threads.sh` | Runs container at 6/10/12 threads, compares output |

### Environment Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `DOCLING_NUM_THREADS` | auto | Override CPU thread count |
| `DOCLING_DEVICE` | `cpu` | Accelerator: cpu, cuda, mps, xpu, auto |
| `DOCLING_LAYOUT_MODEL` | `egret-medium` | Layout model selection |
| `DOCLING_OCR` | `false` | Enable OCR for scanned PDFs |
| `DOCLING_CODE_ENRICHMENT` | `false` | Code block recognition |
| `DOCLING_FORMULA_ENRICHMENT` | `false` | Formula recognition |
| `DOCLING_PICTURE_CLASSIFICATION` | `false` | Picture classification |
| `DOCLING_PICTURE_DESCRIPTION` | `false` | VLM picture description |
| `DOCLING_DOCUMENT_TIMEOUT` | `300` | Per-document timeout (seconds) |

## Deployment Target

**Azure Container App Job** (consumption plan) via Docker Hub.

| Profile | vCPUs | Memory | GPU | DOCLING_NUM_THREADS |
|---------|-------|--------|-----|---------------------|
| CPU | 4 | 8 Gi | None | 4 |
| GPU | Up to 8 | 56 Gi | NVIDIA T4 (NC8as-T4) | 8 |

- CPU profile uses the existing CPU-only PyTorch image
- GPU profile requires a CUDA-enabled build variant (separate Dockerfile or build arg)
- Container registry: Docker Hub (for now)

## Package Management

**uv is the only package manager.** Never use pip, poetry, or conda.

```bash
# Run scripts
uv run --frozen process.py input/file.pdf

# Add dependencies
uv add <package>

# Sync environment
uv sync --frozen

# Add dev dependencies
uv add --dev <package>
```

## Coding Standards

- Type hints on all function signatures and return types
- Logging to stderr via Python `logging` module (stdout reserved for output)
- All Docker commands use `uv run --frozen` for reproducibility
- PyTorch CPU optimisations applied early (MKL-DNN, matmul precision, grad disabled)
- Conventional commits: `type(scope): description`

## Git Workflow

- Branch naming: `feature/`, `fix/`, `chore/`, `docs/` + kebab-case
- Conventional commits enforced by hook
- Squash merge to main
- Keep PRs small and focused

## Testing

No test suite yet. When tests are added:
- Use pytest via `uv run pytest tests/ -x --tb=short`
- Tests in `tests/` directory
- Add ruff and mypy as dev dependencies for quality checks

## Change History

Structured change tracking in `.history/changes.json`. Updated after medium-to-large changes (new files, API changes, config changes, refactors, bug fixes).
