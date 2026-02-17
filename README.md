# Docling CPU Optimisation Guide

A production-ready guide for deploying [Docling](https://github.com/docling-project/docling) on CPU-only infrastructure, targeting mortgage PDF processing workloads.

> **Docling version:** v2.x (2026). API references verified against the official Docling documentation. Performance characteristics are hardware-dependent — no specific timing claims are made.

---

## Table of Contents

1. [Key Concepts](#key-concepts)
2. [Pipeline Configuration](#pipeline-configuration)
3. [Sequential Processing](#sequential-processing)
4. [Parallel Processing](#parallel-processing)
5. [VLM Pipeline](#vlm-pipeline)
6. [Dockerfile](#dockerfile)
7. [Docker Compose Deployment](#docker-compose-deployment)
8. [Tuning Recommendations](#tuning-recommendations)

---

## Key Concepts

### Backend Selection

Docling provides multiple PDF parsing backends. The **current default is `DLPARSE_V4`**, which offers the highest accuracy. You do not need to specify a backend unless you have a specific reason to use an older version.

| Backend | Status | Notes |
|---------|--------|-------|
| `DLPARSE_V4` | **Default** | Highest accuracy, recommended for production |
| `DoclingParseV2DocumentBackend` | Available | Legacy; lower accuracy than V4 |

To explicitly select V2 (not recommended unless you have a specific compatibility need):

```python
from docling.backend.docling_parse_v2_backend import DoclingParseV2DocumentBackend
from docling.document_converter import PdfFormatOption

PdfFormatOption(
    pipeline_options=pipeline_options,
    backend=DoclingParseV2DocumentBackend,
)
```

### Thread Control

The **recommended** mechanism for controlling CPU threading is `AcceleratorOptions`, not environment variables:

```python
from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions

accel = AcceleratorOptions(
    num_threads=8,
    device=AcceleratorDevice.CPU,
)
```

Environment variables (`OMP_NUM_THREADS`, `MKL_NUM_THREADS`, etc.) still work as a fallback but `AcceleratorOptions` is the primary API and should be preferred.

### Model Caching

Pre-fetch models for Docker builds using the official CLI tool:

```bash
docling-tools models download
```

Alternatively, set `artifacts_path` in `PdfPipelineOptions` to control where models are stored. The older `StandardPdfPipeline.download_models_hf()` pattern is not the recommended approach.

### Table Structure Options

The correct class for configuring table extraction is **`TableStructureOptions`**, accessed via `pipeline_options.table_structure_options`. The mode is set via `TableFormerMode`:

```python
from docling.datamodel.pipeline_options import PdfPipelineOptions, TableFormerMode

pipeline_options = PdfPipelineOptions()
pipeline_options.do_table_structure = True
pipeline_options.table_structure_options.mode = TableFormerMode.FAST
```

| Mode | Behaviour |
|------|-----------|
| `TableFormerMode.ACCURATE` | **Default.** Higher quality table extraction |
| `TableFormerMode.FAST` | Faster but lower quality |

> **Note:** The class `TableFormerOptions` does not exist in the Docling API. Use `TableStructureOptions` which is accessed as an attribute of `PdfPipelineOptions`.

### Picture Description

`do_picture_description` is **off by default**. You only need to set it if you want to enable LLM-based image descriptions. There is no need to explicitly disable it.

---

## Pipeline Configuration

A minimal, correct pipeline configuration for CPU processing:

```python
from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import PdfPipelineOptions, TableFormerMode
from docling.document_converter import DocumentConverter, PdfFormatOption

pipeline_options = PdfPipelineOptions(
    accelerator_options=AcceleratorOptions(
        num_threads=8,
        device=AcceleratorDevice.CPU,
    ),
)

# Digital PDFs — no OCR needed
pipeline_options.do_ocr = False

# Enable table detection with FAST mode for speed
pipeline_options.do_table_structure = True
pipeline_options.table_structure_options.mode = TableFormerMode.FAST

converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(
            pipeline_options=pipeline_options,
        )
    }
)

result = converter.convert("document.pdf")
markdown = result.document.export_to_markdown()
```

### Configuration Reference

| Parameter | Default | Purpose |
|-----------|---------|---------|
| `accelerator_options.num_threads` | varies | CPU threads for model inference |
| `accelerator_options.device` | `AUTO` | Force `CPU` to avoid GPU probing |
| `do_ocr` | `True` | Disable for digital (non-scanned) PDFs |
| `do_table_structure` | `True` | Table detection and extraction |
| `table_structure_options.mode` | `ACCURATE` | `FAST` trades quality for speed |
| `do_picture_description` | `False` | Enable LLM-based image descriptions |

---

## Sequential Processing

### Standard Pipeline

For straightforward single-document processing with full feature set:

```python
from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import PdfPipelineOptions, TableFormerMode
from docling.document_converter import DocumentConverter, PdfFormatOption

pipeline_options = PdfPipelineOptions(
    accelerator_options=AcceleratorOptions(
        num_threads=8,
        device=AcceleratorDevice.CPU,
    ),
)
pipeline_options.do_ocr = False
pipeline_options.do_table_structure = True
pipeline_options.table_structure_options.mode = TableFormerMode.FAST

converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(
            pipeline_options=pipeline_options,
        )
    }
)

result = converter.convert("mortgage.pdf")
print(result.document.export_to_markdown())
```

### Minimal Pipeline

For maximum speed when you only need text extraction (no tables, no OCR):

```python
pipeline_options = PdfPipelineOptions(
    accelerator_options=AcceleratorOptions(
        num_threads=8,
        device=AcceleratorDevice.CPU,
    ),
)
pipeline_options.do_ocr = False
pipeline_options.do_table_structure = False

converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(
            pipeline_options=pipeline_options,
        )
    }
)

result = converter.convert("mortgage.pdf")
print(result.document.export_to_markdown())
```

---

## Parallel Processing

### The Correct Approach: `ThreadedStandardPdfPipeline`

Docling's `StandardPdfPipeline` processes documents as a single unit — it runs layout analysis, table structure detection, and assembly across the entire document. It does **not** expose per-page processing primitives.

The officially supported parallelism mechanism is `ThreadedStandardPdfPipeline` with `ThreadedPdfPipelineOptions`. This multi-threaded pipeline runs OCR, layout, and table stages **concurrently across page batches**:

```python
from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import TableFormerMode, ThreadedPdfPipelineOptions
from docling.document_converter import DocumentConverter, PdfFormatOption
from docling.pipeline.threaded_standard_pdf_pipeline import ThreadedStandardPdfPipeline

pipeline_options = ThreadedPdfPipelineOptions(
    accelerator_options=AcceleratorOptions(
        num_threads=8,
        device=AcceleratorDevice.CPU,
    ),
    layout_batch_size=32,
    table_batch_size=4,
)
pipeline_options.do_ocr = False
pipeline_options.do_table_structure = True
pipeline_options.table_structure_options.mode = TableFormerMode.FAST

converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(
            pipeline_cls=ThreadedStandardPdfPipeline,
            pipeline_options=pipeline_options,
        )
    }
)

result = converter.convert("mortgage.pdf")
print(result.document.export_to_markdown())
```

### Batch Size Tuning

The threaded pipeline exposes batch size parameters that control how many pages are processed together in each stage:

| Parameter | Purpose | Suggested Starting Point |
|-----------|---------|--------------------------|
| `layout_batch_size` | Pages per layout model batch | 32–64 |
| `table_batch_size` | Pages per table model batch | 2–4 |
| `ocr_batch_size` | Pages per OCR batch | 2–4 |

Optimal values depend on your hardware (CPU count, available memory) and document characteristics. Start with the defaults and adjust based on profiling.

### Multi-Document Batch Processing

For processing multiple documents, use `converter.convert_all()`:

```python
sources = [
    "document1.pdf",
    "document2.pdf",
    "document3.pdf",
]

results = converter.convert_all(sources)
for result in results:
    md = result.document.export_to_markdown()
    print(f"--- {result.input.file} ---")
    print(md[:500])
```

For high-throughput scenarios, consider `docling-serve` for external orchestration with multiple workers.

### Why Custom Page-Level Parallelism Does Not Work

Approaches that split a PDF into individual pages, process each independently, and merge the results are **not supported** by Docling's architecture:

- **Model loading overhead:** Docling loads AI models per converter instance. Splitting into N pages and processing them doesn't parallelise model inference — it either serialises on the GIL or redundantly loads models.
- **No per-page primitives:** The pipeline runs layout analysis, table detection, and document assembly as integrated stages across the full document.
- **Coordinate systems:** Docling uses absolute coordinates (typically bottom-left origin with point values), not normalised 0–1 ranges. Merging results from independently processed pages would require handling these coordinate systems correctly.

The `ThreadedStandardPdfPipeline` achieves parallelism at the right level of abstraction — concurrent execution of pipeline stages across page batches within a single document conversion.

---

## VLM Pipeline

Docling supports VLM (Vision-Language Model) based processing as an alternative pipeline. The correct API:

```python
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import VlmPipelineOptions
from docling.document_converter import DocumentConverter, PdfFormatOption
from docling.pipeline.vlm_pipeline import VlmPipeline

vlm_options = VlmPipelineOptions(
    # Configure VLM-specific options here
)

converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(
            pipeline_cls=VlmPipeline,
            pipeline_options=vlm_options,
        )
    }
)

result = converter.convert("document.pdf")
```

> **Note:** Mixing standard and VLM pipelines per-page within a single document conversion is not supported. The `page_range` parameter on `converter.convert()` can be used to process specific page ranges, but each conversion call uses a single pipeline.

---

## Dockerfile

The Dockerfile uses a multi-stage build to keep the runtime image small, installs CPU-only PyTorch, and pre-fetches models so they are baked into the image.

See [`Dockerfile`](./Dockerfile) in this repository.

Key design decisions:

- **Multi-stage build** — build dependencies (gcc, g++, etc.) are not included in the runtime image.
- **CPU-only PyTorch** — uses `--index-url https://download.pytorch.org/whl/cpu` to avoid pulling CUDA dependencies.
- **No `--no-cache-dir`** — the BuildKit cache mount (`--mount=type=cache`) handles caching. Adding `--no-cache-dir` would contradict the mount.
- **Model pre-fetch** — `docling-tools models download` bakes models into the image so containers start without network downloads.
- **Non-root user** — runs as `docling` user for security.

---

## Docker Compose Deployment

See [`docker-compose.yml`](./docker-compose.yml) in this repository.

```yaml
services:
  docling:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - ./input:/home/docling/input:ro
      - ./output:/home/docling/output
    deploy:
      resources:
        limits:
          # Account for model loading overhead (2-3 GB) plus working memory
          memory: 6g
          cpus: "8"
        reservations:
          memory: 3g
          cpus: "4"
    environment:
      - HF_HOME=/home/docling/.cache/huggingface
    entrypoint: ["python", "process.py"]
    command: ["input/mortgage.pdf"]
```

**Memory sizing:** The standard pipeline models require 2–3 GB during loading. Set memory limits to account for this overhead plus working memory for document processing.

---

## Tuning Recommendations

### CPU Thread Count

Set `num_threads` in `AcceleratorOptions` to match your available CPU cores. Over-subscribing (more threads than cores) can cause contention and reduce throughput.

### OCR

Disable OCR (`do_ocr=False`) for digitally-created PDFs. OCR adds significant processing time and is unnecessary when the PDF already contains extractable text.

### Table Mode

Use `TableFormerMode.FAST` when processing speed matters more than table extraction quality. Use `TableFormerMode.ACCURATE` (the default) when table fidelity is critical.

### Threaded Pipeline Batch Sizes

Start with the defaults and profile on your specific workload. Larger batch sizes use more memory but can improve throughput by amortising model overhead. Smaller batch sizes reduce peak memory usage.

### Environment Variables (Fallback)

If `AcceleratorOptions` is insufficient for your needs, these environment variables provide additional control:

| Variable | Purpose |
|----------|---------|
| `OMP_NUM_THREADS` | OpenMP thread count |
| `MKL_NUM_THREADS` | MKL thread count |
| `TORCH_NUM_THREADS` | PyTorch CPU thread count |
| `HF_HOME` | Hugging Face cache directory |

Set these in your Dockerfile or docker-compose environment section as needed.
