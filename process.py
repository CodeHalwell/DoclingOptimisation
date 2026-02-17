"""Docling CPU-optimised processor for mortgage PDFs.

Uses the ThreadedStandardPdfPipeline for parallel stage execution
(OCR, layout, table detection) across page batches. This is the
officially supported parallelism mechanism in Docling v2.x.
"""

import logging
from pathlib import Path

from docling.datamodel.accelerator_options import AcceleratorDevice, AcceleratorOptions
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import (
    PdfPipelineOptions,
    TableFormerMode,
    ThreadedPdfPipelineOptions,
)
from docling.document_converter import DocumentConverter, PdfFormatOption
from docling.pipeline.threaded_standard_pdf_pipeline import ThreadedStandardPdfPipeline

_log = logging.getLogger(__name__)


def create_converter(
    num_threads: int = 8,
    do_ocr: bool = False,
    do_table_structure: bool = True,
    table_mode: TableFormerMode = TableFormerMode.FAST,
    use_threaded: bool = True,
) -> DocumentConverter:
    """Create an optimised DocumentConverter for CPU processing.

    Args:
        num_threads: CPU threads for model inference.
        do_ocr: Enable OCR (disable for digital PDFs).
        do_table_structure: Enable table detection.
        table_mode: FAST or ACCURATE table extraction.
        use_threaded: Use threaded pipeline for parallel stage execution.
    """
    accel = AcceleratorOptions(
        num_threads=num_threads,
        device=AcceleratorDevice.CPU,
    )

    if use_threaded:
        pipeline_options = ThreadedPdfPipelineOptions(
            accelerator_options=accel,
            layout_batch_size=32,
            table_batch_size=4,
        )
        pipeline_cls = ThreadedStandardPdfPipeline
    else:
        pipeline_options = PdfPipelineOptions(
            accelerator_options=accel,
        )
        pipeline_cls = None  # Uses default StandardPdfPipeline

    pipeline_options.do_ocr = do_ocr
    pipeline_options.do_table_structure = do_table_structure
    if do_table_structure:
        pipeline_options.table_structure_options.mode = table_mode

    format_opts = {
        InputFormat.PDF: PdfFormatOption(
            pipeline_options=pipeline_options,
            **({"pipeline_cls": pipeline_cls} if pipeline_cls else {}),
        )
    }

    return DocumentConverter(format_options=format_opts)


def process_mortgage_pdf(pdf_path: str | Path) -> str:
    """Process a mortgage PDF and return structured markdown.

    Uses the threaded pipeline with table structure detection enabled
    (FAST mode) and OCR disabled for digital PDFs.
    """
    converter = create_converter(
        num_threads=8,
        do_ocr=False,
        do_table_structure=True,
        table_mode=TableFormerMode.FAST,
        use_threaded=True,
    )

    result = converter.convert(str(pdf_path))
    return result.document.export_to_markdown()


if __name__ == "__main__":
    import sys
    import time

    pdf = sys.argv[1] if len(sys.argv) > 1 else "mortgage.pdf"
    start = time.perf_counter()
    md = process_mortgage_pdf(pdf)
    elapsed = time.perf_counter() - start

    print(f"Processed in {elapsed:.2f}s")
    print(md[:2000])
