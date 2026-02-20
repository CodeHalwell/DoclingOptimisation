"""Docling CPU-optimised processor for mortgage PDFs.

Uses the ThreadedStandardPdfPipeline for parallel stage execution
(OCR, layout, table detection) across page batches. This is the
officially supported parallelism mechanism in Docling v2.x.

CPU resources are auto-detected from cgroup limits (Docker --cpus)
with fallback to os.cpu_count(), so the container adapts to whatever
resources the host allocates.
"""

import logging
import os
import sys
import time
from pathlib import Path

log = logging.getLogger("docling-processor")

# ---------------------------------------------------------------------------
# Timing helpers
# ---------------------------------------------------------------------------

_t0 = time.perf_counter()


def _step(msg: str) -> None:
    """Log a step with elapsed time since process start."""
    elapsed = time.perf_counter() - _t0
    log.info("[%7.2fs] %s", elapsed, msg)


# ---------------------------------------------------------------------------
# PyTorch CPU optimizations (applied early, before model loading)
# ---------------------------------------------------------------------------

def _apply_torch_optimizations() -> None:
    """Configure PyTorch for optimal CPU inference.

    - Enables MKL-DNN (oneDNN) backend for optimised CPU kernels.
    - Lowers float32 matmul precision to allow bfloat16/TF32 on capable
      CPUs (Intel Xeon Gen3+ with AMX, or any CPU with AVX-512 BF16).
      This can yield 2-3x speedup on matrix-heavy operations.
    - Disables gradient computation globally (belt-and-suspenders with
      inference_mode already used by docling, but guards any code path
      that misses it).
    """
    import torch

    torch.backends.mkldnn.enabled = True
    torch.set_float32_matmul_precision("medium")
    torch.set_grad_enabled(False)

    _step(
        f"PyTorch optimized: mkldnn={torch.backends.mkldnn.enabled}, "
        f"matmul_precision=medium, grad=off"
    )


# ---------------------------------------------------------------------------
# CPU detection
# ---------------------------------------------------------------------------


def detect_cpu_count() -> int:
    """Detect available CPUs, respecting Docker/cgroup limits.

    Checks cgroup v2 first, then v1, then falls back to os.cpu_count().
    The DOCLING_NUM_THREADS env var overrides everything.
    """
    env_override = os.environ.get("DOCLING_NUM_THREADS")
    if env_override:
        return int(env_override)

    # cgroup v2 (modern Docker / Kubernetes)
    try:
        with open("/sys/fs/cgroup/cpu.max") as f:
            quota, period = f.read().strip().split()
            if quota != "max":
                return max(1, int(quota) // int(period))
    except (FileNotFoundError, ValueError, PermissionError):
        pass

    # cgroup v1
    try:
        with open("/sys/fs/cgroup/cpu/cpu.cfs_quota_us") as f:
            quota = int(f.read().strip())
        if quota > 0:
            with open("/sys/fs/cgroup/cpu/cpu.cfs_period_us") as f:
                period = int(f.read().strip())
            return max(1, quota // period)
    except (FileNotFoundError, ValueError, PermissionError):
        pass

    return os.cpu_count() or 4


def apply_thread_env(cpus: int) -> None:
    """Set threading env vars so ONNX Runtime / PyTorch / OpenMP align.

    Always syncs to the detected CPU count. Operator overrides via
    DOCLING_NUM_THREADS or docker run -e DOCLING_NUM_THREADS take
    precedence through detect_cpu_count().
    """
    for var in ("OMP_NUM_THREADS", "MKL_NUM_THREADS"):
        os.environ[var] = str(cpus)


# ---------------------------------------------------------------------------
# Converter factory
# ---------------------------------------------------------------------------


def create_converter(
    num_threads: int | None = None,
    do_ocr: bool = False,
    do_table_structure: bool = True,
    table_mode=None,
    use_threaded: bool = True,
    force_backend_text: bool = True,
):
    """Create an optimised DocumentConverter for CPU processing.

    Args:
        num_threads: CPU threads for model inference. Auto-detected if None.
        do_ocr: Enable OCR (disable for digital PDFs).
        do_table_structure: Enable table detection.
        table_mode: FAST or ACCURATE table extraction.
        use_threaded: Use threaded pipeline for parallel stage execution.
        force_backend_text: Use PDF's embedded text layer directly (faster
            for digital PDFs that already have a reliable text layer).
    """
    _step("Loading docling libraries...")
    from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions
    from docling.datamodel.base_models import InputFormat
    from docling.datamodel.pipeline_options import (
        DOCLING_LAYOUT_EGRET_LARGE,
        DOCLING_LAYOUT_EGRET_MEDIUM,
        DOCLING_LAYOUT_EGRET_XLARGE,
        DOCLING_LAYOUT_HERON,
        CodeFormulaVlmOptions,
        LayoutOptions,
        PdfPipelineOptions,
        PictureDescriptionVlmEngineOptions,
        TableFormerMode,
        TableStructureOptions,
        ThreadedPdfPipelineOptions,
    )
    from docling.datamodel.settings import settings
    from docling.document_converter import DocumentConverter, PdfFormatOption
    from docling.pipeline.threaded_standard_pdf_pipeline import ThreadedStandardPdfPipeline
    _step("Libraries loaded")

    # Enable pipeline profiling to identify bottlenecks
    settings.debug.profile_pipeline_timings = True

    _apply_torch_optimizations()

    # Layout model selection via env var
    _layout_models = {
        "heron": DOCLING_LAYOUT_HERON,
        "egret-medium": DOCLING_LAYOUT_EGRET_MEDIUM,
        "egret-large": DOCLING_LAYOUT_EGRET_LARGE,
        "egret-xlarge": DOCLING_LAYOUT_EGRET_XLARGE,
    }
    layout_model_name = os.environ.get("DOCLING_LAYOUT_MODEL", "egret-medium").lower()
    layout_model_spec = _layout_models.get(layout_model_name, DOCLING_LAYOUT_HERON)
    _step(f"Layout model: {layout_model_name}")

    if table_mode is None:
        table_mode = TableFormerMode.FAST

    if num_threads is None:
        num_threads = detect_cpu_count()

    apply_thread_env(num_threads)
    _step(f"CPU config: {num_threads} threads, OMP={os.environ.get('OMP_NUM_THREADS')}, MKL={os.environ.get('MKL_NUM_THREADS')}")

    accel = AcceleratorOptions(
        num_threads=num_threads,
        device=AcceleratorDevice.CPU,
    )

    if use_threaded:
        layout_batch = min(num_threads * 2, 16)
        table_batch = min(num_threads, 4)

        pipeline_options = ThreadedPdfPipelineOptions(
            accelerator_options=accel,
            layout_batch_size=layout_batch,
            table_batch_size=table_batch,
            batch_polling_interval_seconds=0.1,
        )
        pipeline_cls = ThreadedStandardPdfPipeline
        _step(f"Threaded pipeline: layout_batch={layout_batch}, table_batch={table_batch}, poll=0.1s")
    else:
        pipeline_options = PdfPipelineOptions(
            accelerator_options=accel,
        )
        pipeline_cls = None

    pipeline_options.do_ocr = do_ocr
    pipeline_options.do_table_structure = do_table_structure
    pipeline_options.force_backend_text = force_backend_text
    pipeline_options.do_code_enrichment = os.environ.get("DOCLING_CODE_ENRICHMENT", "false").lower() == "true"
    pipeline_options.do_formula_enrichment = os.environ.get("DOCLING_FORMULA_ENRICHMENT", "false").lower() == "true"
    pipeline_options.do_picture_classification = os.environ.get("DOCLING_PICTURE_CLASSIFICATION", "false").lower() == "true"
    pipeline_options.do_picture_description = os.environ.get("DOCLING_PICTURE_DESCRIPTION", "false").lower() == "true"

    # Only configure VLM options when enrichment is enabled (avoids model loading overhead)
    if pipeline_options.do_code_enrichment or pipeline_options.do_formula_enrichment:
        code_formula_preset = os.environ.get("DOCLING_CODE_FORMULA_MODEL", "granite_docling")
        pipeline_options.code_formula_options = CodeFormulaVlmOptions.from_preset(code_formula_preset)
        _step(f"Code/formula model: {code_formula_preset}")

    if pipeline_options.do_picture_description:
        pipeline_options.picture_description_options = PictureDescriptionVlmEngineOptions.from_preset("smolvlm")
        _step("Picture description model: smolvlm")
    pipeline_options.generate_page_images = False
    pipeline_options.generate_picture_images = False
    pipeline_options.generate_parsed_pages = False
    pipeline_options.document_timeout = int(os.environ.get("DOCLING_DOCUMENT_TIMEOUT", "300"))
    pipeline_options.layout_options = LayoutOptions(
        model_spec=layout_model_spec,
    )

    if do_table_structure:
        pipeline_options.table_structure_options = TableStructureOptions(
            mode=table_mode,
            do_cell_matching=os.environ.get("DOCLING_CELL_MATCHING", "true").lower() == "true",
        )

    _step(f"Pipeline: layout={layout_model_name}, force_backend_text={force_backend_text}, timeout=120s")

    format_opts = {
        InputFormat.PDF: PdfFormatOption(
            pipeline_options=pipeline_options,
            **({"pipeline_cls": pipeline_cls} if pipeline_cls else {}),
        )
    }

    _step("Building converter...")
    converter = DocumentConverter(format_options=format_opts)
    _step("Converter ready")
    return converter


# ---------------------------------------------------------------------------
# Processing
# ---------------------------------------------------------------------------


def process_mortgage_pdf(pdf_path: str | Path) -> str:
    """Process a mortgage PDF and return structured markdown.

    Uses the threaded pipeline with table structure detection enabled
    (FAST mode) and OCR disabled for digital PDFs.

    Raises:
        FileNotFoundError: If the PDF file does not exist.
        PermissionError: If the PDF file is not readable.
    """
    pdf_file = Path(pdf_path)
    if not pdf_file.exists():
        raise FileNotFoundError(f"PDF file not found: {pdf_path}")
    if not pdf_file.is_file():
        if pdf_file.is_dir():
            raise ValueError(f"Path is a directory, not a file: {pdf_path}")
        else:
            raise ValueError(f"Path exists but is not a regular file: {pdf_path}")

    _step(f"Input: {pdf_file.name} ({pdf_file.stat().st_size / 1024:.1f} KB)")

    converter = create_converter(
        do_ocr=os.environ.get("DOCLING_OCR", "false").lower() == "true",
        do_table_structure=True,
        use_threaded=True,
    )

    _step("Starting document conversion...")
    result = converter.convert(str(pdf_path))
    _step("Conversion complete")

    _step("Exporting to markdown...")
    md = result.document.export_to_markdown()
    _step(f"Export complete ({len(md)} chars)")

    return md


# ---------------------------------------------------------------------------
# CLI entrypoint
# ---------------------------------------------------------------------------

if __name__ == "__main__":
    logging.basicConfig(
        level=logging.INFO,
        format="%(message)s",
        stream=sys.stderr,
    )

    cpus = detect_cpu_count()
    _step(f"Process started — auto-detected {cpus} CPUs")

    pdf = sys.argv[1] if len(sys.argv) > 1 else "mortgage.pdf"
    md = process_mortgage_pdf(pdf)

    total = time.perf_counter() - _t0
    _step(f"Done — total {total:.2f}s")

    # Markdown to stdout (logs go to stderr so they don't mix)
    print(md)
