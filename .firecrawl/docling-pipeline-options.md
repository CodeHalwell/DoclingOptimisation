[Skip to content](https://docling-project.github.io/docling/reference/pipeline_options/#pipeline-options)

# Pipeline options

Pipeline options allow to customize the execution of the models during the conversion pipeline.
This includes options for the OCR engines, the table model as well as enrichment options which
can be enabled with `do_xyz = True`.

This is an automatic generated API reference of the all the pipeline options available in Docling.

## ``pipeline\_options

Classes:

- **`AsrPipelineOptions`**
–



Configuration options for the Automatic Speech Recognition (ASR) pipeline.

- **`BaseLayoutOptions`**
–



Base options for layout models.

- **`BaseOptions`**
–



Base class for options.

- **`BaseTableStructureOptions`**
–



Base options for table structure models.

- **`CodeFormulaVlmOptions`**
–



Configuration for VLM-based code and formula extraction.

- **`ConvertPipelineOptions`**
–



Base configuration for document conversion pipelines.

- **`EasyOcrOptions`**
–



Configuration for EasyOCR engine.

- **`LayoutObjectDetectionOptions`**
–



Options for layout detection using object-detection runtimes.

- **`LayoutOptions`**
–



Options for layout processing.

- **`OcrAutoOptions`**
–



Automatic OCR engine selection based on system availability.

- **`OcrEngine`**
–



Available OCR (Optical Character Recognition) engines for text extraction from images.

- **`OcrMacOptions`**
–



Configuration for native macOS OCR using Vision framework.

- **`OcrOptions`**
–



OCR options.

- **`PaginatedPipelineOptions`**
–



Configuration for pipelines processing paginated documents.

- **`PdfBackend`**
–



Available PDF parsing backends for document processing.

- **`PdfPipelineOptions`**
–



Configuration options for the PDF document processing pipeline.

- **`PictureDescriptionApiOptions`**
–



Configuration for API-based picture description services.

- **`PictureDescriptionBaseOptions`**
–



Base configuration for picture description models.

- **`PictureDescriptionVlmEngineOptions`**
–



Configuration for VLM runtime-based picture description.

- **`PictureDescriptionVlmOptions`**
–



Configuration for inline vision-language models for picture description.

- **`PipelineOptions`**
–



Base configuration for document processing pipelines.

- **`ProcessingPipeline`**
–



Available document processing pipeline types for different use cases.

- **`RapidOcrOptions`**
–



Configuration for RapidOCR engine with multiple backend support.

- **`TableFormerMode`**
–



Operating modes for TableFormer table structure extraction model.

- **`TableStructureOptions`**
–



Configuration for table structure extraction using the TableFormer model.

- **`TesseractCliOcrOptions`**
–



Configuration for Tesseract OCR via command-line interface.

- **`TesseractOcrOptions`**
–



Configuration for Tesseract OCR via Python bindings (tesserocr).

- **`ThreadedPdfPipelineOptions`**
–



Pipeline options for the threaded PDF pipeline with batching and backpressure control

- **`VlmConvertOptions`**
–



Configuration for VLM-based document conversion.

- **`VlmExtractionPipelineOptions`**
–



Options for extraction pipeline.

- **`VlmPipelineOptions`**
–



Pipeline configuration for vision-language model based document processing.


Functions:

- **`normalize_pdf_backend`**
–



Normalize deprecated backend enum values to current ones.


Attributes:

- **`granite_picture_description`**
–



Pre-configured Granite Vision model options for picture description.

- **`smolvlm_picture_description`**
–



Pre-configured SmolVLM model options for picture description.


### ``granite\_picture\_description`module-attribute`

```
granite_picture_description = PictureDescriptionVlmOptions(repo_id='ibm-granite/granite-vision-3.3-2b', prompt='What is shown in this image?')
```

Pre-configured Granite Vision model options for picture description.

Uses IBM's Granite Vision 3.3-2B model with a custom prompt for generating
detailed descriptions of image content.

### ``smolvlm\_picture\_description`module-attribute`

```
smolvlm_picture_description = PictureDescriptionVlmOptions(repo_id='HuggingFaceTB/SmolVLM-256M-Instruct')
```

Pre-configured SmolVLM model options for picture description.

Uses the HuggingFace SmolVLM-256M-Instruct model, a lightweight vision-language model
optimized for generating natural language descriptions of images.

### ``AsrPipelineOptions`pydantic-model`

Bases: `PipelineOptions`

Configuration options for the Automatic Speech Recognition (ASR) pipeline.

This pipeline processes audio files and converts speech to text using Whisper-based models.
Supports various audio formats (MP3, WAV, FLAC, etc.) and video files with audio tracks.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "InlineAsrOptions": {
      "description": "Configuration for inline ASR models running locally.",
      "properties": {
        "kind": {
          "const": "inline_model_options",
          "default": "inline_model_options",
          "title": "Kind",
          "type": "string"
        },
        "repo_id": {
          "description": "HuggingFace model repository ID for the ASR model. Must be a Whisper-compatible model for automatic speech recognition.",
          "examples": [\
            "openai/whisper-tiny",\
            "openai/whisper-base"\
          ],
          "title": "Repo Id",
          "type": "string"
        },
        "verbose": {
          "default": false,
          "description": "Enable verbose logging output from the ASR model for debugging purposes.",
          "title": "Verbose",
          "type": "boolean"
        },
        "timestamps": {
          "default": true,
          "description": "Generate timestamps for transcribed segments. When enabled, each transcribed segment includes start and end times for temporal alignment with the audio.",
          "title": "Timestamps",
          "type": "boolean"
        },
        "temperature": {
          "default": 0.0,
          "description": "Sampling temperature for text generation. 0.0 uses greedy decoding (deterministic), higher values (e.g., 0.7-1.0) increase randomness. Recommended: 0.0 for consistent transcriptions.",
          "title": "Temperature",
          "type": "number"
        },
        "max_new_tokens": {
          "default": 256,
          "description": "Maximum number of tokens to generate per transcription segment. Limits output length to prevent runaway generation. Adjust based on expected transcript length.",
          "title": "Max New Tokens",
          "type": "integer"
        },
        "max_time_chunk": {
          "default": 30.0,
          "description": "Maximum duration in seconds for each audio chunk processed by the model. Audio longer than this is split into chunks. Whisper models are typically trained on 30-second segments.",
          "title": "Max Time Chunk",
          "type": "number"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "PyTorch data type for model weights. Options: `float32`, `float16`, `bfloat16`. Lower precision (float16/bfloat16) reduces memory usage and increases speed. If None, uses model default.",
          "title": "Torch Dtype"
        },
        "supported_devices": {
          "default": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ],
          "description": "List of hardware accelerators supported by this ASR model configuration.",
          "items": {
            "$ref": "#/$defs/AcceleratorDevice"
          },
          "title": "Supported Devices",
          "type": "array"
        }
      },
      "required": [\
        "repo_id"\
      ],
      "title": "InlineAsrOptions",
      "type": "object"
    }
  },
  "description": "Configuration options for the Automatic Speech Recognition (ASR) pipeline.\n\nThis pipeline processes audio files and converts speech to text using Whisper-based models.\nSupports various audio formats (MP3, WAV, FLAC, etc.) and video files with audio tracks.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "asr_options": {
      "$ref": "#/$defs/InlineAsrOptions",
      "default": {
        "kind": "inline_model_options",
        "repo_id": "tiny",
        "verbose": true,
        "timestamps": true,
        "temperature": 0.0,
        "max_new_tokens": 256,
        "max_time_chunk": 30.0,
        "torch_dtype": null,
        "supported_devices": [\
          "cpu",\
          "cuda"\
        ],
        "inference_framework": "whisper",
        "language": "en",
        "word_timestamps": true
      },
      "description": "Automatic Speech Recognition (ASR) model configuration for audio transcription. Specifies which ASR model to use (e.g., Whisper variants) and model-specific parameters for speech-to-text conversion."
    }
  },
  "title": "AsrPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `asr_options`
(`InlineAsrOptions`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``asr\_options`pydantic-field`

```
asr_options: InlineAsrOptions
```

Automatic Speech Recognition (ASR) model configuration for audio transcription. Specifies which ASR model to use (e.g., Whisper variants) and model-specific parameters for speech-to-text conversion.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``kind`class-attribute`

```
kind: str
```

### ``BaseLayoutOptions`pydantic-model`

Bases: `BaseOptions`

Base options for layout models.

Show JSON schema:

```
{
  "description": "Base options for layout models.",
  "properties": {
    "keep_empty_clusters": {
      "default": false,
      "description": "Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.",
      "title": "Keep Empty Clusters",
      "type": "boolean"
    },
    "skip_cell_assignment": {
      "default": false,
      "description": "Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.",
      "title": "Skip Cell Assignment",
      "type": "boolean"
    }
  },
  "title": "BaseLayoutOptions",
  "type": "object"
}
```

Fields:

- `keep_empty_clusters`
(`bool`)

- `skip_cell_assignment`
(`bool`)


#### ``keep\_empty\_clusters`pydantic-field`

```
keep_empty_clusters: bool
```

Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.

#### ``kind`class-attribute`

```
kind: str
```

#### ``skip\_cell\_assignment`pydantic-field`

```
skip_cell_assignment: bool
```

Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.

### ``BaseOptions`pydantic-model`

Bases: `BaseModel`

Base class for options.

Show JSON schema:

```
{
  "description": "Base class for options.",
  "properties": {},
  "title": "BaseOptions",
  "type": "object"
}
```

#### ``kind`class-attribute`

```
kind: str
```

### ``BaseTableStructureOptions`pydantic-model`

Bases: `BaseOptions`

Base options for table structure models.

Show JSON schema:

```
{
  "description": "Base options for table structure models.",
  "properties": {},
  "title": "BaseTableStructureOptions",
  "type": "object"
}
```

#### ``kind`class-attribute`

```
kind: str
```

### ``CodeFormulaVlmOptions`pydantic-model`

Bases: `StagePresetMixin`, `VlmEngineOptionsMixin`, `BaseModel`

Configuration for VLM-based code and formula extraction.

This stage uses vision-language models to extract code blocks and
mathematical formulas from document images. Supports preset-based
configuration via StagePresetMixin.

Examples:

#### Use CodeFormulaV2 preset

options = CodeFormulaVlmOptions.from\_preset("codeformulav2")

#### Use Granite Docling preset

options = CodeFormulaVlmOptions.from\_preset("granite\_docling")

Show JSON schema:

```
{
  "$defs": {
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Configuration for VLM-based code and formula extraction.\n\nThis stage uses vision-language models to extract code blocks and\nmathematical formulas from document images. Supports preset-based\nconfiguration via StagePresetMixin.\n\nExamples:\n    # Use CodeFormulaV2 preset\n    options = CodeFormulaVlmOptions.from_preset(\"codeformulav2\")\n\n    # Use Granite Docling preset\n    options = CodeFormulaVlmOptions.from_preset(\"granite_docling\")",
  "properties": {
    "engine_options": {
      "$ref": "#/$defs/BaseVlmEngineOptions",
      "description": "Runtime configuration (transformers, mlx, api, etc.)"
    },
    "model_spec": {
      "$ref": "#/$defs/VlmModelSpec",
      "description": "Model specification with runtime-specific overrides"
    },
    "scale": {
      "default": 2.0,
      "description": "Image scaling factor for preprocessing",
      "title": "Scale",
      "type": "number"
    },
    "max_size": {
      "anyOf": [\
        {\
          "type": "integer"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum image dimension (width or height)",
      "title": "Max Size"
    },
    "extract_code": {
      "default": true,
      "description": "Extract code blocks",
      "title": "Extract Code",
      "type": "boolean"
    },
    "extract_formulas": {
      "default": true,
      "description": "Extract mathematical formulas",
      "title": "Extract Formulas",
      "type": "boolean"
    }
  },
  "required": [\
    "engine_options",\
    "model_spec"\
  ],
  "title": "CodeFormulaVlmOptions",
  "type": "object"
}
```

Fields:

- `engine_options`
(`BaseVlmEngineOptions`)

- `model_spec`
(`VlmModelSpec`)

- `scale`
(`float`)

- `max_size`
(`Optional[int]`)

- `extract_code`
(`bool`)

- `extract_formulas`
(`bool`)


#### ``engine\_options`pydantic-field`

```
engine_options: BaseVlmEngineOptions
```

Runtime configuration (transformers, mlx, api, etc.)

#### ``extract\_code`pydantic-field`

```
extract_code: bool = True
```

Extract code blocks

#### ``extract\_formulas`pydantic-field`

```
extract_formulas: bool = True
```

Extract mathematical formulas

#### ``max\_size`pydantic-field`

```
max_size: Optional[int] = None
```

Maximum image dimension (width or height)

#### ``model\_spec`pydantic-field`

```
model_spec: VlmModelSpec
```

Model specification with runtime-specific overrides

#### ``scale`pydantic-field`

```
scale: float = 2.0
```

Image scaling factor for preprocessing

#### ``from\_preset`classmethod`

```
from_preset(preset_id: str, engine_options: Optional[BaseVlmEngineOptions] = None, **overrides)
```

Create options from a registered preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier

- **`engine_options`**
(`Optional[BaseVlmEngineOptions]`, default:
`None`
)
–



Optional engine override

- **`**overrides`**
–



Additional option overrides


Returns:

- –



Instance of the stage options class


#### ``get\_preset`classmethod`

```
get_preset(preset_id: str) -> StageModelPreset
```

Get a specific preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier


Returns:

- `StageModelPreset`
–



The requested preset


Raises:

- `KeyError`
–



If preset not found


#### ``get\_preset\_info`classmethod`

```
get_preset_info() -> List[Dict[str, str]]
```

Get summary info for all presets (useful for CLI).

Returns:

- `List[Dict[str, str]]`
–



List of dicts with preset\_id, name, description, model


#### ``list\_preset\_ids`classmethod`

```
list_preset_ids() -> List[str]
```

List all preset IDs for this stage.

Returns:

- `List[str]`
–



List of preset IDs


#### ``list\_presets`classmethod`

```
list_presets() -> List[StageModelPreset]
```

List all presets for this stage.

Returns:

- `List[StageModelPreset]`
–



List of presets


#### ``register\_preset`classmethod`

```
register_preset(preset: StageModelPreset) -> None
```

Register a preset for this stage options class.

Parameters:

- **`preset`**
(`StageModelPreset`)
–



The preset to register


Note

If preset ID already registered, it will be silently skipped.
This allows for idempotent registration at module import time.

#### ``resolve\_engine\_options`classmethod`

```
resolve_engine_options(value)
```

### ``ConvertPipelineOptions`pydantic-model`

Bases: `PipelineOptions`

Base configuration for document conversion pipelines.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "PictureDescriptionBaseOptions": {
      "description": "Base configuration for picture description models.",
      "properties": {
        "batch_size": {
          "default": 8,
          "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
          "title": "Batch Size",
          "type": "integer"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "picture_area_threshold": {
          "default": 0.05,
          "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
          "title": "Picture Area Threshold",
          "type": "number"
        },
        "classification_allow": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
          "title": "Classification Allow"
        },
        "classification_deny": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
          "title": "Classification Deny"
        },
        "classification_min_confidence": {
          "default": 0.0,
          "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
          "title": "Classification Min Confidence",
          "type": "number"
        }
      },
      "title": "PictureDescriptionBaseOptions",
      "type": "object"
    }
  },
  "description": "Base configuration for document conversion pipelines.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "do_picture_classification": {
      "default": false,
      "description": "Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.",
      "title": "Do Picture Classification",
      "type": "boolean"
    },
    "do_picture_description": {
      "default": false,
      "description": "Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.",
      "title": "Do Picture Description",
      "type": "boolean"
    },
    "picture_description_options": {
      "$ref": "#/$defs/PictureDescriptionBaseOptions",
      "default": {
        "batch_size": 8,
        "scale": 2.0,
        "picture_area_threshold": 0.05,
        "classification_allow": null,
        "classification_deny": null,
        "classification_min_confidence": 0.0,
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_lmstudio": {
              "params": {
                "model": "smolvlm-256m-instruct"
              }
            }
          },
          "default_repo_id": "HuggingFaceTB/SmolVLM-256M-Instruct",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "moot20/SmolVLM-256M-Instruct-MLX",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": "bfloat16"
            }
          },
          "max_new_tokens": 4096,
          "name": "SmolVLM-256M-Instruct",
          "prompt": "Describe this image in a few sentences.",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "prompt": "Describe this image in a few sentences.",
        "generation_config": {
          "do_sample": false,
          "max_new_tokens": 200
        }
      },
      "description": "Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from_preset('granite_vision')"
    },
    "do_chart_extraction": {
      "default": false,
      "title": "Do Chart Extraction",
      "type": "boolean"
    }
  },
  "title": "ConvertPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `do_picture_classification`
(`bool`)

- `do_picture_description`
(`bool`)

- `picture_description_options`
(`PictureDescriptionBaseOptions`)

- `do_chart_extraction`
(`bool`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``do\_chart\_extraction`pydantic-field`

```
do_chart_extraction: bool = False
```

#### ``do\_picture\_classification`pydantic-field`

```
do_picture_classification: bool
```

Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.

#### ``do\_picture\_description`pydantic-field`

```
do_picture_description: bool
```

Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``kind`class-attribute`

```
kind: str
```

#### ``picture\_description\_options`pydantic-field`

```
picture_description_options: PictureDescriptionBaseOptions
```

Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from\_preset('granite\_vision')

### ``EasyOcrOptions`pydantic-model`

Bases: `OcrOptions`

Configuration for EasyOCR engine.

Show JSON schema:

```
{
  "additionalProperties": false,
  "description": "Configuration for EasyOCR engine.",
  "properties": {
    "lang": {
      "default": [\
        "fr",\
        "de",\
        "es",\
        "en"\
      ],
      "description": "List of language codes for OCR. EasyOCR supports 80+ languages. Use ISO 639-1 codes (e.g., `en`, `fr`, `de`). Multiple languages can be specified for multilingual documents.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    },
    "use_gpu": {
      "anyOf": [\
        {\
          "type": "boolean"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Enable GPU acceleration for EasyOCR. If None, automatically detects and uses GPU if available. Set to False to force CPU-only processing.",
      "title": "Use Gpu"
    },
    "confidence_threshold": {
      "default": 0.5,
      "description": "Minimum confidence score for text recognition. Text with confidence below this threshold is filtered out. Range: 0.0-1.0. Lower values include more text but may reduce accuracy.",
      "title": "Confidence Threshold",
      "type": "number"
    },
    "model_storage_directory": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Directory path for storing downloaded EasyOCR models. If None, uses default EasyOCR cache location. Useful for offline environments or custom model management.",
      "title": "Model Storage Directory"
    },
    "recog_network": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": "standard",
      "description": "Recognition network architecture to use. Options: `standard` (default, balanced), `craft` (higher accuracy). Different networks may perform better on specific document types.",
      "title": "Recog Network"
    },
    "download_enabled": {
      "default": true,
      "description": "Allow automatic download of EasyOCR models on first use. Disable for offline environments where models must be pre-installed.",
      "title": "Download Enabled",
      "type": "boolean"
    },
    "suppress_mps_warnings": {
      "default": true,
      "description": "Suppress Metal Performance Shaders (MPS) warnings on macOS. Reduces console noise when using Apple Silicon GPUs with EasyOCR.",
      "title": "Suppress Mps Warnings",
      "type": "boolean"
    }
  },
  "title": "EasyOcrOptions",
  "type": "object"
}
```

Config:

- `extra`: `forbid`
- `protected_namespaces`: `()`

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)

- `use_gpu`
(`Optional[bool]`)

- `confidence_threshold`
(`float`)

- `model_storage_directory`
(`Optional[str]`)

- `recog_network`
(`Optional[str]`)

- `download_enabled`
(`bool`)

- `suppress_mps_warnings`
(`bool`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``confidence\_threshold`pydantic-field`

```
confidence_threshold: float
```

Minimum confidence score for text recognition. Text with confidence below this threshold is filtered out. Range: 0.0-1.0. Lower values include more text but may reduce accuracy.

#### ``download\_enabled`pydantic-field`

```
download_enabled: bool
```

Allow automatic download of EasyOCR models on first use. Disable for offline environments where models must be pre-installed.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: Literal['easyocr'] = 'easyocr'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of language codes for OCR. EasyOCR supports 80+ languages. Use ISO 639-1 codes (e.g., `en`, `fr`, `de`). Multiple languages can be specified for multilingual documents.

#### ``model\_config`class-attribute``instance-attribute`

```
model_config = ConfigDict(extra='forbid', protected_namespaces=())
```

#### ``model\_storage\_directory`pydantic-field`

```
model_storage_directory: Optional[str]
```

Directory path for storing downloaded EasyOCR models. If None, uses default EasyOCR cache location. Useful for offline environments or custom model management.

#### ``recog\_network`pydantic-field`

```
recog_network: Optional[str]
```

Recognition network architecture to use. Options: `standard` (default, balanced), `craft` (higher accuracy). Different networks may perform better on specific document types.

#### ``suppress\_mps\_warnings`pydantic-field`

```
suppress_mps_warnings: bool
```

Suppress Metal Performance Shaders (MPS) warnings on macOS. Reduces console noise when using Apple Silicon GPUs with EasyOCR.

#### ``use\_gpu`pydantic-field`

```
use_gpu: Optional[bool]
```

Enable GPU acceleration for EasyOCR. If None, automatically detects and uses GPU if available. Set to False to force CPU-only processing.

### ``LayoutObjectDetectionOptions`pydantic-model`

Bases: `ObjectDetectionStagePresetMixin`, `ObjectDetectionEngineOptionsMixin`, `BaseLayoutOptions`

Options for layout detection using object-detection runtimes.

Show JSON schema:

```
{
  "$defs": {
    "BaseObjectDetectionEngineOptions": {
      "description": "Base configuration shared across object-detection engines.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/ObjectDetectionEngineType",
          "description": "Type of inference engine to use"
        },
        "score_threshold": {
          "default": 0.3,
          "description": "Minimum confidence score to keep a detection (0.0 to 1.0)",
          "title": "Score Threshold",
          "type": "number"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseObjectDetectionEngineOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "ObjectDetectionEngineType": {
      "description": "Supported inference engine types for object-detection models.",
      "enum": [\
        "onnxruntime",\
        "transformers"\
      ],
      "title": "ObjectDetectionEngineType",
      "type": "string"
    },
    "ObjectDetectionModelSpec": {
      "description": "Specification for an object detection model.\n\nSimpler than VlmModelSpec - no prompts, no preprocessing params.\nPreprocessing comes from HuggingFace preprocessor configs.\nModel files are assumed to be at the root of the HuggingFace repo.",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/ObjectDetectionEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        }
      },
      "required": [\
        "name",\
        "repo_id"\
      ],
      "title": "ObjectDetectionModelSpec",
      "type": "object"
    }
  },
  "description": "Options for layout detection using object-detection runtimes.",
  "properties": {
    "keep_empty_clusters": {
      "default": false,
      "description": "Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.",
      "title": "Keep Empty Clusters",
      "type": "boolean"
    },
    "skip_cell_assignment": {
      "default": false,
      "description": "Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.",
      "title": "Skip Cell Assignment",
      "type": "boolean"
    },
    "engine_options": {
      "$ref": "#/$defs/BaseObjectDetectionEngineOptions",
      "description": "Runtime configuration for the object-detection engine"
    },
    "create_orphan_clusters": {
      "default": false,
      "description": "Create clusters for orphaned elements not assigned to any structure. When True, isolated text or elements are grouped into their own clusters. Recommended for complete document coverage.",
      "title": "Create Orphan Clusters",
      "type": "boolean"
    },
    "model_spec": {
      "$ref": "#/$defs/ObjectDetectionModelSpec",
      "description": "Object-detection model specification for layout analysis"
    }
  },
  "required": [\
    "engine_options"\
  ],
  "title": "LayoutObjectDetectionOptions",
  "type": "object"
}
```

Fields:

- `keep_empty_clusters`
(`bool`)

- `skip_cell_assignment`
(`bool`)

- `engine_options`
(`BaseObjectDetectionEngineOptions`)

- `create_orphan_clusters`
(`bool`)

- `model_spec`
(`ObjectDetectionModelSpec`)


#### ``create\_orphan\_clusters`pydantic-field`

```
create_orphan_clusters: bool
```

Create clusters for orphaned elements not assigned to any structure. When True, isolated text or elements are grouped into their own clusters. Recommended for complete document coverage.

#### ``engine\_options`pydantic-field`

```
engine_options: BaseObjectDetectionEngineOptions
```

Runtime configuration for the object-detection engine

#### ``keep\_empty\_clusters`pydantic-field`

```
keep_empty_clusters: bool
```

Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.

#### ``kind`class-attribute`

```
kind: str = 'layout_object_detection'
```

#### ``model\_spec`pydantic-field`

```
model_spec: ObjectDetectionModelSpec
```

Object-detection model specification for layout analysis

#### ``skip\_cell\_assignment`pydantic-field`

```
skip_cell_assignment: bool
```

Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.

#### ``from\_preset`classmethod`

```
from_preset(preset_id: str, engine_options: Optional[BaseObjectDetectionEngineOptions] = None, **overrides: Any)
```

#### ``get\_preset`classmethod`

```
get_preset(preset_id: str) -> ObjectDetectionStagePreset
```

#### ``get\_preset\_info`classmethod`

```
get_preset_info() -> List[Dict[str, str]]
```

#### ``list\_preset\_ids`classmethod`

```
list_preset_ids() -> List[str]
```

#### ``list\_presets`classmethod`

```
list_presets() -> List[ObjectDetectionStagePreset]
```

#### ``register\_preset`classmethod`

```
register_preset(preset: ObjectDetectionStagePreset) -> None
```

#### ``resolve\_engine\_options`classmethod`

```
resolve_engine_options(value)
```

### ``LayoutOptions`pydantic-model`

Bases: `BaseLayoutOptions`

Options for layout processing.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "LayoutModelConfig": {
      "description": "Configuration for document layout analysis models from HuggingFace.",
      "properties": {
        "name": {
          "description": "Human-readable name identifier for the layout model. Used for logging, debugging, and model selection.",
          "examples": [\
            "docling_layout_heron",\
            "docling_layout_egret_large"\
          ],
          "title": "Name",
          "type": "string"
        },
        "repo_id": {
          "description": "HuggingFace repository ID where the model is hosted. Used to download model weights and configuration files from HuggingFace Hub.",
          "examples": [\
            "docling-project/docling-layout-heron",\
            "docling-project/docling-layout-egret-large"\
          ],
          "title": "Repo Id",
          "type": "string"
        },
        "revision": {
          "description": "Git revision (branch, tag, or commit hash) of the model repository to use. Allows pinning to specific model versions for reproducibility.",
          "examples": [\
            "main",\
            "v1.0.0"\
          ],
          "title": "Revision",
          "type": "string"
        },
        "model_path": {
          "description": "Relative path within the repository to model artifacts. Empty string indicates artifacts are in the repository root. Used for repositories with multiple models or nested structures.",
          "title": "Model Path",
          "type": "string"
        },
        "supported_devices": {
          "default": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ],
          "description": "List of hardware accelerators supported by this model. The model can only run on devices in this list.",
          "items": {
            "$ref": "#/$defs/AcceleratorDevice"
          },
          "title": "Supported Devices",
          "type": "array"
        }
      },
      "required": [\
        "name",\
        "repo_id",\
        "revision",\
        "model_path"\
      ],
      "title": "LayoutModelConfig",
      "type": "object"
    }
  },
  "description": "Options for layout processing.",
  "properties": {
    "keep_empty_clusters": {
      "default": false,
      "description": "Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.",
      "title": "Keep Empty Clusters",
      "type": "boolean"
    },
    "skip_cell_assignment": {
      "default": false,
      "description": "Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.",
      "title": "Skip Cell Assignment",
      "type": "boolean"
    },
    "create_orphan_clusters": {
      "default": true,
      "description": "Create clusters for orphaned elements not assigned to any structure. When True, isolated text or elements are grouped into their own clusters. Recommended for complete document coverage.",
      "title": "Create Orphan Clusters",
      "type": "boolean"
    },
    "model_spec": {
      "$ref": "#/$defs/LayoutModelConfig",
      "default": {
        "name": "docling_layout_heron",
        "repo_id": "docling-project/docling-layout-heron",
        "revision": "main",
        "model_path": "",
        "supported_devices": [\
          "cpu",\
          "cuda",\
          "mps",\
          "xpu"\
        ]
      },
      "description": "Layout model configuration specifying which model to use for document layout analysis. Options include DOCLING_LAYOUT_HERON (default, balanced), DOCLING_LAYOUT_EGRET_* (higher accuracy), etc."
    }
  },
  "title": "LayoutOptions",
  "type": "object"
}
```

Fields:

- `keep_empty_clusters`
(`bool`)

- `skip_cell_assignment`
(`bool`)

- `create_orphan_clusters`
(`bool`)

- `model_spec`
(`LayoutModelConfig`)


#### ``create\_orphan\_clusters`pydantic-field`

```
create_orphan_clusters: bool
```

Create clusters for orphaned elements not assigned to any structure. When True, isolated text or elements are grouped into their own clusters. Recommended for complete document coverage.

#### ``keep\_empty\_clusters`pydantic-field`

```
keep_empty_clusters: bool
```

Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.

#### ``kind`class-attribute`

```
kind: str = 'docling_layout_default'
```

#### ``model\_spec`pydantic-field`

```
model_spec: LayoutModelConfig
```

Layout model configuration specifying which model to use for document layout analysis. Options include DOCLING\_LAYOUT\_HERON (default, balanced), DOCLING\_LAYOUT\_EGRET\_\* (higher accuracy), etc.

#### ``skip\_cell\_assignment`pydantic-field`

```
skip_cell_assignment: bool
```

Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.

### ``OcrAutoOptions`pydantic-model`

Bases: `OcrOptions`

Automatic OCR engine selection based on system availability.

Show JSON schema:

```
{
  "description": "Automatic OCR engine selection based on system availability.",
  "properties": {
    "lang": {
      "default": [],
      "description": "The automatic OCR engine will use the default values of the engine. Please specify the engine explicitly to change the language selection.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    }
  },
  "title": "OcrAutoOptions",
  "type": "object"
}
```

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: Literal['auto'] = 'auto'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

The automatic OCR engine will use the default values of the engine. Please specify the engine explicitly to change the language selection.

### ``OcrEngine

Bases: `str`, `Enum`

Available OCR (Optical Character Recognition) engines for text extraction from images.

Each engine has different characteristics in terms of accuracy, speed, language support,
and platform compatibility. Choose based on your specific requirements.

Attributes:

- **`AUTO`**
–



Automatically select the best available OCR engine based on platform and installed libraries.

- **`EASYOCR`**
–



Deep learning-based OCR supporting 80+ languages with GPU acceleration.

- **`TESSERACT_CLI`**
–



Tesseract OCR via command-line interface (requires system installation).

- **`TESSERACT`**
–



Tesseract OCR via Python bindings (tesserocr library).

- **`OCRMAC`**
–



Native macOS Vision framework OCR (Apple platforms only).

- **`RAPIDOCR`**
–



Lightweight OCR with multiple backend options (ONNX, OpenVINO, PaddlePaddle).


#### ``AUTO`class-attribute``instance-attribute`

```
AUTO = 'auto'
```

#### ``EASYOCR`class-attribute``instance-attribute`

```
EASYOCR = 'easyocr'
```

#### ``OCRMAC`class-attribute``instance-attribute`

```
OCRMAC = 'ocrmac'
```

#### ``RAPIDOCR`class-attribute``instance-attribute`

```
RAPIDOCR = 'rapidocr'
```

#### ``TESSERACT`class-attribute``instance-attribute`

```
TESSERACT = 'tesseract'
```

#### ``TESSERACT\_CLI`class-attribute``instance-attribute`

```
TESSERACT_CLI = 'tesseract_cli'
```

### ``OcrMacOptions`pydantic-model`

Bases: `OcrOptions`

Configuration for native macOS OCR using Vision framework.

Show JSON schema:

```
{
  "additionalProperties": false,
  "description": "Configuration for native macOS OCR using Vision framework.",
  "properties": {
    "lang": {
      "default": [\
        "fr-FR",\
        "de-DE",\
        "es-ES",\
        "en-US"\
      ],
      "description": "List of language locale codes for macOS OCR. Use format `language-REGION` (e.g., `en-US`, `fr-FR`). Leverages native macOS Vision framework for OCR on Apple platforms.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    },
    "recognition": {
      "default": "accurate",
      "description": "Recognition accuracy level. Options: `accurate` (higher quality, slower) or `fast` (lower quality, faster). Choose based on speed vs. accuracy requirements.",
      "title": "Recognition",
      "type": "string"
    },
    "framework": {
      "default": "vision",
      "description": "macOS framework to use for OCR. Currently supports `vision` (Apple Vision framework). Future versions may support additional frameworks.",
      "title": "Framework",
      "type": "string"
    }
  },
  "title": "OcrMacOptions",
  "type": "object"
}
```

Config:

- `extra`: `forbid`

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)

- `recognition`
(`str`)

- `framework`
(`str`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``framework`pydantic-field`

```
framework: str
```

macOS framework to use for OCR. Currently supports `vision` (Apple Vision framework). Future versions may support additional frameworks.

#### ``kind`class-attribute`

```
kind: Literal['ocrmac'] = 'ocrmac'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of language locale codes for macOS OCR. Use format `language-REGION` (e.g., `en-US`, `fr-FR`). Leverages native macOS Vision framework for OCR on Apple platforms.

#### ``model\_config`class-attribute``instance-attribute`

```
model_config = ConfigDict(extra='forbid')
```

#### ``recognition`pydantic-field`

```
recognition: str
```

Recognition accuracy level. Options: `accurate` (higher quality, slower) or `fast` (lower quality, faster). Choose based on speed vs. accuracy requirements.

### ``OcrOptions`pydantic-model`

Bases: `BaseOptions`

OCR options.

Show JSON schema:

```
{
  "description": "OCR options.",
  "properties": {
    "lang": {
      "description": "List of OCR languages to use. The format must match the values of the OCR engine of choice.",
      "examples": [\
        [\
          "deu",\
          "eng"\
        ]\
      ],
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    }
  },
  "required": [\
    "lang"\
  ],
  "title": "OcrOptions",
  "type": "object"
}
```

Fields:

- `lang`
(`list[str]`)

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: str
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of OCR languages to use. The format must match the values of the OCR engine of choice.

### ``PaginatedPipelineOptions`pydantic-model`

Bases: `ConvertPipelineOptions`

Configuration for pipelines processing paginated documents.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "PictureDescriptionBaseOptions": {
      "description": "Base configuration for picture description models.",
      "properties": {
        "batch_size": {
          "default": 8,
          "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
          "title": "Batch Size",
          "type": "integer"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "picture_area_threshold": {
          "default": 0.05,
          "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
          "title": "Picture Area Threshold",
          "type": "number"
        },
        "classification_allow": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
          "title": "Classification Allow"
        },
        "classification_deny": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
          "title": "Classification Deny"
        },
        "classification_min_confidence": {
          "default": 0.0,
          "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
          "title": "Classification Min Confidence",
          "type": "number"
        }
      },
      "title": "PictureDescriptionBaseOptions",
      "type": "object"
    }
  },
  "description": "Configuration for pipelines processing paginated documents.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "do_picture_classification": {
      "default": false,
      "description": "Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.",
      "title": "Do Picture Classification",
      "type": "boolean"
    },
    "do_picture_description": {
      "default": false,
      "description": "Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.",
      "title": "Do Picture Description",
      "type": "boolean"
    },
    "picture_description_options": {
      "$ref": "#/$defs/PictureDescriptionBaseOptions",
      "default": {
        "batch_size": 8,
        "scale": 2.0,
        "picture_area_threshold": 0.05,
        "classification_allow": null,
        "classification_deny": null,
        "classification_min_confidence": 0.0,
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_lmstudio": {
              "params": {
                "model": "smolvlm-256m-instruct"
              }
            }
          },
          "default_repo_id": "HuggingFaceTB/SmolVLM-256M-Instruct",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "moot20/SmolVLM-256M-Instruct-MLX",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": "bfloat16"
            }
          },
          "max_new_tokens": 4096,
          "name": "SmolVLM-256M-Instruct",
          "prompt": "Describe this image in a few sentences.",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "prompt": "Describe this image in a few sentences.",
        "generation_config": {
          "do_sample": false,
          "max_new_tokens": 200
        }
      },
      "description": "Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from_preset('granite_vision')"
    },
    "do_chart_extraction": {
      "default": false,
      "title": "Do Chart Extraction",
      "type": "boolean"
    },
    "images_scale": {
      "default": 1.0,
      "description": "Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).",
      "title": "Images Scale",
      "type": "number"
    },
    "generate_page_images": {
      "default": false,
      "description": "Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.",
      "title": "Generate Page Images",
      "type": "boolean"
    },
    "generate_picture_images": {
      "default": false,
      "description": "Extract and save embedded images from the document. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.",
      "title": "Generate Picture Images",
      "type": "boolean"
    }
  },
  "title": "PaginatedPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `do_picture_classification`
(`bool`)

- `do_picture_description`
(`bool`)

- `picture_description_options`
(`PictureDescriptionBaseOptions`)

- `do_chart_extraction`
(`bool`)

- `images_scale`
(`float`)

- `generate_page_images`
(`bool`)

- `generate_picture_images`
(`bool`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``do\_chart\_extraction`pydantic-field`

```
do_chart_extraction: bool = False
```

#### ``do\_picture\_classification`pydantic-field`

```
do_picture_classification: bool
```

Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.

#### ``do\_picture\_description`pydantic-field`

```
do_picture_description: bool
```

Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``generate\_page\_images`pydantic-field`

```
generate_page_images: bool
```

Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.

#### ``generate\_picture\_images`pydantic-field`

```
generate_picture_images: bool
```

Extract and save embedded images from the document. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.

#### ``images\_scale`pydantic-field`

```
images_scale: float
```

Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).

#### ``kind`class-attribute`

```
kind: str
```

#### ``picture\_description\_options`pydantic-field`

```
picture_description_options: PictureDescriptionBaseOptions
```

Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from\_preset('granite\_vision')

### ``PdfBackend

Bases: `str`, `Enum`

Available PDF parsing backends for document processing.

Different backends offer varying levels of text extraction quality, layout preservation,
and processing speed. Choose based on your document complexity and quality requirements.

Attributes:

- **`PYPDFIUM2`**
–



Standard PDF parser using PyPDFium2 library. Fast and reliable for basic text extraction.

- **`DLPARSE_V1`**
–



Docling Parse v1 backend with enhanced layout analysis and structure preservation.

- **`DLPARSE_V2`**
–



Docling Parse v2 backend with improved table detection and complex layout handling.

- **`DLPARSE_V4`**
–



Docling Parse v4 backend (latest) with advanced features and best accuracy for complex documents.


#### ``DLPARSE\_V1`class-attribute``instance-attribute`

```
DLPARSE_V1 = 'dlparse_v1'
```

#### ``DLPARSE\_V2`class-attribute``instance-attribute`

```
DLPARSE_V2 = 'dlparse_v2'
```

#### ``DLPARSE\_V4`class-attribute``instance-attribute`

```
DLPARSE_V4 = 'dlparse_v4'
```

#### ``DOCLING\_PARSE`class-attribute``instance-attribute`

```
DOCLING_PARSE = 'docling_parse'
```

#### ``PYPDFIUM2`class-attribute``instance-attribute`

```
PYPDFIUM2 = 'pypdfium2'
```

### ``PdfPipelineOptions`pydantic-model`

Bases: `PaginatedPipelineOptions`

Configuration options for the PDF document processing pipeline.

Notes

- Enabling multiple features (OCR, table structure, formulas) increases the processing time significantly.
Enable only necessary features for your use case.
- For production systems processing large document volumes, implement a timeout protection (for instance, 90-120
seconds via `document_timeout` parameter).
- OCR requires a system installation of engines (Tesseract, EasyOCR). Verify the installation before enabling
OCR via `do_ocr=True`.
- RapidOCR has known issues with read-only filesystems (e.g., Databricks). Consider Tesseract or alternative
backends for distributed systems.

See Also

- `examples/pipeline_options_advanced.py`: Comprehensive configuration examples.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseLayoutOptions": {
      "description": "Base options for layout models.",
      "properties": {
        "keep_empty_clusters": {
          "default": false,
          "description": "Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.",
          "title": "Keep Empty Clusters",
          "type": "boolean"
        },
        "skip_cell_assignment": {
          "default": false,
          "description": "Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.",
          "title": "Skip Cell Assignment",
          "type": "boolean"
        }
      },
      "title": "BaseLayoutOptions",
      "type": "object"
    },
    "BaseTableStructureOptions": {
      "description": "Base options for table structure models.",
      "properties": {},
      "title": "BaseTableStructureOptions",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "CodeFormulaVlmOptions": {
      "description": "Configuration for VLM-based code and formula extraction.\n\nThis stage uses vision-language models to extract code blocks and\nmathematical formulas from document images. Supports preset-based\nconfiguration via StagePresetMixin.\n\nExamples:\n    # Use CodeFormulaV2 preset\n    options = CodeFormulaVlmOptions.from_preset(\"codeformulav2\")\n\n    # Use Granite Docling preset\n    options = CodeFormulaVlmOptions.from_preset(\"granite_docling\")",
      "properties": {
        "engine_options": {
          "$ref": "#/$defs/BaseVlmEngineOptions",
          "description": "Runtime configuration (transformers, mlx, api, etc.)"
        },
        "model_spec": {
          "$ref": "#/$defs/VlmModelSpec",
          "description": "Model specification with runtime-specific overrides"
        },
        "scale": {
          "default": 2.0,
          "description": "Image scaling factor for preprocessing",
          "title": "Scale",
          "type": "number"
        },
        "max_size": {
          "anyOf": [\
            {\
              "type": "integer"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Maximum image dimension (width or height)",
          "title": "Max Size"
        },
        "extract_code": {
          "default": true,
          "description": "Extract code blocks",
          "title": "Extract Code",
          "type": "boolean"
        },
        "extract_formulas": {
          "default": true,
          "description": "Extract mathematical formulas",
          "title": "Extract Formulas",
          "type": "boolean"
        }
      },
      "required": [\
        "engine_options",\
        "model_spec"\
      ],
      "title": "CodeFormulaVlmOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "OcrOptions": {
      "description": "OCR options.",
      "properties": {
        "lang": {
          "description": "List of OCR languages to use. The format must match the values of the OCR engine of choice.",
          "examples": [\
            [\
              "deu",\
              "eng"\
            ]\
          ],
          "items": {
            "type": "string"
          },
          "title": "Lang",
          "type": "array"
        },
        "force_full_page_ocr": {
          "default": false,
          "description": "If enabled, a full-page OCR is always applied.",
          "examples": [\
            false\
          ],
          "title": "Force Full Page Ocr",
          "type": "boolean"
        },
        "bitmap_area_threshold": {
          "default": 0.05,
          "description": "Percentage of the page area for a bitmap to be processed with OCR.",
          "examples": [\
            0.05,\
            0.1\
          ],
          "title": "Bitmap Area Threshold",
          "type": "number"
        }
      },
      "required": [\
        "lang"\
      ],
      "title": "OcrOptions",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "PictureDescriptionBaseOptions": {
      "description": "Base configuration for picture description models.",
      "properties": {
        "batch_size": {
          "default": 8,
          "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
          "title": "Batch Size",
          "type": "integer"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "picture_area_threshold": {
          "default": 0.05,
          "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
          "title": "Picture Area Threshold",
          "type": "number"
        },
        "classification_allow": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
          "title": "Classification Allow"
        },
        "classification_deny": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
          "title": "Classification Deny"
        },
        "classification_min_confidence": {
          "default": 0.0,
          "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
          "title": "Classification Min Confidence",
          "type": "number"
        }
      },
      "title": "PictureDescriptionBaseOptions",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Configuration options for the PDF document processing pipeline.\n\nNotes:\n    - Enabling multiple features (OCR, table structure, formulas) increases the processing time significantly.\n        Enable only necessary features for your use case.\n    - For production systems processing large document volumes, implement a timeout protection (for instance, 90-120\n        seconds via `document_timeout` parameter).\n    - OCR requires a system installation of engines (Tesseract, EasyOCR). Verify the installation before enabling\n        OCR via `do_ocr=True`.\n    - RapidOCR has known issues with read-only filesystems (e.g., Databricks). Consider Tesseract or alternative\n        backends for distributed systems.\n\nSee Also:\n    - `examples/pipeline_options_advanced.py`: Comprehensive configuration examples.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "do_picture_classification": {
      "default": false,
      "description": "Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.",
      "title": "Do Picture Classification",
      "type": "boolean"
    },
    "do_picture_description": {
      "default": false,
      "description": "Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.",
      "title": "Do Picture Description",
      "type": "boolean"
    },
    "picture_description_options": {
      "$ref": "#/$defs/PictureDescriptionBaseOptions",
      "default": {
        "batch_size": 8,
        "scale": 2.0,
        "picture_area_threshold": 0.05,
        "classification_allow": null,
        "classification_deny": null,
        "classification_min_confidence": 0.0,
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_lmstudio": {
              "params": {
                "model": "smolvlm-256m-instruct"
              }
            }
          },
          "default_repo_id": "HuggingFaceTB/SmolVLM-256M-Instruct",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "moot20/SmolVLM-256M-Instruct-MLX",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": "bfloat16"
            }
          },
          "max_new_tokens": 4096,
          "name": "SmolVLM-256M-Instruct",
          "prompt": "Describe this image in a few sentences.",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "prompt": "Describe this image in a few sentences.",
        "generation_config": {
          "do_sample": false,
          "max_new_tokens": 200
        }
      },
      "description": "Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from_preset('granite_vision')"
    },
    "do_chart_extraction": {
      "default": false,
      "title": "Do Chart Extraction",
      "type": "boolean"
    },
    "images_scale": {
      "default": 1.0,
      "description": "Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).",
      "title": "Images Scale",
      "type": "number"
    },
    "generate_page_images": {
      "default": false,
      "description": "Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.",
      "title": "Generate Page Images",
      "type": "boolean"
    },
    "generate_picture_images": {
      "default": false,
      "description": "Extract and save embedded images from the PDF. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.",
      "title": "Generate Picture Images",
      "type": "boolean"
    },
    "do_table_structure": {
      "default": true,
      "description": "Enable table structure extraction and reconstruction. Detects table regions, extracts cell content with row/column relationships, and reconstructs the logical table structure for downstream processing.",
      "title": "Do Table Structure",
      "type": "boolean"
    },
    "do_ocr": {
      "default": true,
      "description": "Enable Optical Character Recognition for scanned or image-based PDFs. Replaces or supplements programmatic text extraction with OCR-detected text. Required for scanned documents with no embedded text layer. Note: OCR significantly increases processing time.",
      "title": "Do Ocr",
      "type": "boolean"
    },
    "do_code_enrichment": {
      "default": false,
      "description": "Enable specialized processing for code blocks. Applies code-aware OCR and formatting to improve accuracy of programming language snippets, terminal output, and structured code content.",
      "title": "Do Code Enrichment",
      "type": "boolean"
    },
    "do_formula_enrichment": {
      "default": false,
      "description": "Enable mathematical formula recognition and LaTeX conversion. Uses specialized models to detect and extract mathematical expressions, converting them to LaTeX format for accurate representation.",
      "title": "Do Formula Enrichment",
      "type": "boolean"
    },
    "force_backend_text": {
      "default": false,
      "description": "Force use of PDF backend's native text extraction instead of layout model predictions. When enabled, bypasses the layout model's text detection and uses the embedded text from the PDF file directly. Useful for PDFs with reliable programmatic text layers.",
      "title": "Force Backend Text",
      "type": "boolean"
    },
    "table_structure_options": {
      "$ref": "#/$defs/BaseTableStructureOptions",
      "default": {
        "do_cell_matching": true,
        "mode": "accurate"
      },
      "description": "Configuration for table structure extraction. Controls table detection accuracy, cell matching behavior, and table formatting. Only applicable when `do_table_structure=True`."
    },
    "ocr_options": {
      "$ref": "#/$defs/OcrOptions",
      "default": {
        "lang": [],
        "force_full_page_ocr": false,
        "bitmap_area_threshold": 0.05
      },
      "description": "Configuration for OCR engine. Specifies which OCR engine to use (Tesseract, EasyOCR, RapidOCR, etc.) and engine-specific settings. Only applicable when `do_ocr=True`."
    },
    "layout_options": {
      "$ref": "#/$defs/BaseLayoutOptions",
      "default": {
        "keep_empty_clusters": false,
        "skip_cell_assignment": false,
        "create_orphan_clusters": true,
        "model_spec": {
          "model_path": "",
          "name": "docling_layout_heron",
          "repo_id": "docling-project/docling-layout-heron",
          "revision": "main",
          "supported_devices": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ]
        }
      },
      "description": "Configuration for document layout analysis model. Controls layout detection behavior including cluster creation for orphaned elements, cell assignment to table structures, and handling of empty regions. Specifies which layout model to use (default: Heron)."
    },
    "code_formula_options": {
      "$ref": "#/$defs/CodeFormulaVlmOptions",
      "default": {
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {},
          "default_repo_id": "docling-project/CodeFormulaV2",
          "engine_overrides": {
            "transformers": {
              "extra_config": {
                "extra_generation_config": {
                  "skip_special_tokens": false
                },
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": null
            }
          },
          "max_new_tokens": 4096,
          "name": "CodeFormulaV2",
          "prompt": "",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [\
            "</doctag>",\
            "<end_of_utterance>"\
          ],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "scale": 2.0,
        "max_size": null,
        "extract_code": true,
        "extract_formulas": true
      },
      "description": "Configuration for code and formula extraction using VLM. Uses new preset system (recommended). Default: 'default' preset. Only applicable when `do_code_enrichment=True` or `do_formula_enrichment=True`. Example: CodeFormulaVlmOptions.from_preset('granite_vision')"
    },
    "generate_table_images": {
      "default": false,
      "deprecated": true,
      "title": "Generate Table Images",
      "type": "boolean"
    },
    "generate_parsed_pages": {
      "default": false,
      "description": "Retain intermediate parsed page representations after processing. When enabled, keeps detailed page-level parsing data structures for debugging or advanced post-processing. Increases memory usage. Automatically disabled after document assembly unless explicitly enabled.",
      "title": "Generate Parsed Pages",
      "type": "boolean"
    },
    "ocr_batch_size": {
      "default": 4,
      "description": "Batch size for OCR processing stage in threaded pipeline. Pages are grouped and processed together to improve throughput. Higher values increase GPU/CPU utilization but require more memory. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Ocr Batch Size",
      "type": "integer"
    },
    "layout_batch_size": {
      "default": 4,
      "description": "Batch size for layout analysis stage in threaded pipeline. Pages are grouped and processed together by the layout model. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Layout Batch Size",
      "type": "integer"
    },
    "table_batch_size": {
      "default": 4,
      "description": "Batch size for table structure extraction stage in threaded pipeline. Tables from multiple pages are processed together. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Table Batch Size",
      "type": "integer"
    },
    "batch_polling_interval_seconds": {
      "default": 0.5,
      "description": "Polling interval in seconds for batch collection in threaded pipeline stages. Each stage waits up to this duration to accumulate items before processing. Lower values reduce latency but may decrease batching efficiency. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Batch Polling Interval Seconds",
      "type": "number"
    },
    "queue_max_size": {
      "default": 100,
      "description": "Maximum queue size for inter-stage communication in threaded pipeline. Limits the number of items buffered between processing stages to prevent memory overflow. When full, upstream stages block until space is available. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Queue Max Size",
      "type": "integer"
    }
  },
  "title": "PdfPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `do_picture_classification`
(`bool`)

- `do_picture_description`
(`bool`)

- `picture_description_options`
(`PictureDescriptionBaseOptions`)

- `do_chart_extraction`
(`bool`)

- `do_table_structure`
(`bool`)

- `do_ocr`
(`bool`)

- `do_code_enrichment`
(`bool`)

- `do_formula_enrichment`
(`bool`)

- `force_backend_text`
(`bool`)

- `table_structure_options`
(`BaseTableStructureOptions`)

- `ocr_options`
(`OcrOptions`)

- `layout_options`
(`BaseLayoutOptions`)

- `code_formula_options`
(`CodeFormulaVlmOptions`)

- `images_scale`
(`float`)

- `generate_page_images`
(`bool`)

- `generate_picture_images`
(`bool`)

- `generate_table_images`
(`bool`)

- `generate_parsed_pages`
(`bool`)

- `ocr_batch_size`
(`int`)

- `layout_batch_size`
(`int`)

- `table_batch_size`
(`int`)

- `batch_polling_interval_seconds`
(`float`)

- `queue_max_size`
(`int`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``batch\_polling\_interval\_seconds`pydantic-field`

```
batch_polling_interval_seconds: float
```

Polling interval in seconds for batch collection in threaded pipeline stages. Each stage waits up to this duration to accumulate items before processing. Lower values reduce latency but may decrease batching efficiency. Only used by `StandardPdfPipeline` (threaded mode).

#### ``code\_formula\_options`pydantic-field`

```
code_formula_options: CodeFormulaVlmOptions
```

Configuration for code and formula extraction using VLM. Uses new preset system (recommended). Default: 'default' preset. Only applicable when `do_code_enrichment=True` or `do_formula_enrichment=True`. Example: CodeFormulaVlmOptions.from\_preset('granite\_vision')

#### ``do\_chart\_extraction`pydantic-field`

```
do_chart_extraction: bool = False
```

#### ``do\_code\_enrichment`pydantic-field`

```
do_code_enrichment: bool
```

Enable specialized processing for code blocks. Applies code-aware OCR and formatting to improve accuracy of programming language snippets, terminal output, and structured code content.

#### ``do\_formula\_enrichment`pydantic-field`

```
do_formula_enrichment: bool
```

Enable mathematical formula recognition and LaTeX conversion. Uses specialized models to detect and extract mathematical expressions, converting them to LaTeX format for accurate representation.

#### ``do\_ocr`pydantic-field`

```
do_ocr: bool
```

Enable Optical Character Recognition for scanned or image-based PDFs. Replaces or supplements programmatic text extraction with OCR-detected text. Required for scanned documents with no embedded text layer. Note: OCR significantly increases processing time.

#### ``do\_picture\_classification`pydantic-field`

```
do_picture_classification: bool
```

Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.

#### ``do\_picture\_description`pydantic-field`

```
do_picture_description: bool
```

Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.

#### ``do\_table\_structure`pydantic-field`

```
do_table_structure: bool
```

Enable table structure extraction and reconstruction. Detects table regions, extracts cell content with row/column relationships, and reconstructs the logical table structure for downstream processing.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``force\_backend\_text`pydantic-field`

```
force_backend_text: bool
```

Force use of PDF backend's native text extraction instead of layout model predictions. When enabled, bypasses the layout model's text detection and uses the embedded text from the PDF file directly. Useful for PDFs with reliable programmatic text layers.

#### ``generate\_page\_images`pydantic-field`

```
generate_page_images: bool
```

Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.

#### ``generate\_parsed\_pages`pydantic-field`

```
generate_parsed_pages: bool
```

Retain intermediate parsed page representations after processing. When enabled, keeps detailed page-level parsing data structures for debugging or advanced post-processing. Increases memory usage. Automatically disabled after document assembly unless explicitly enabled.

#### ``generate\_picture\_images`pydantic-field`

```
generate_picture_images: bool
```

Extract and save embedded images from the PDF. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.

#### ``generate\_table\_images`pydantic-field`

```
generate_table_images: bool
```

#### ``images\_scale`pydantic-field`

```
images_scale: float
```

Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).

#### ``kind`class-attribute`

```
kind: str
```

#### ``layout\_batch\_size`pydantic-field`

```
layout_batch_size: int
```

Batch size for layout analysis stage in threaded pipeline. Pages are grouped and processed together by the layout model. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).

#### ``layout\_options`pydantic-field`

```
layout_options: BaseLayoutOptions
```

Configuration for document layout analysis model. Controls layout detection behavior including cluster creation for orphaned elements, cell assignment to table structures, and handling of empty regions. Specifies which layout model to use (default: Heron).

#### ``ocr\_batch\_size`pydantic-field`

```
ocr_batch_size: int
```

Batch size for OCR processing stage in threaded pipeline. Pages are grouped and processed together to improve throughput. Higher values increase GPU/CPU utilization but require more memory. Only used by `StandardPdfPipeline` (threaded mode).

#### ``ocr\_options`pydantic-field`

```
ocr_options: OcrOptions
```

Configuration for OCR engine. Specifies which OCR engine to use (Tesseract, EasyOCR, RapidOCR, etc.) and engine-specific settings. Only applicable when `do_ocr=True`.

#### ``picture\_description\_options`pydantic-field`

```
picture_description_options: PictureDescriptionBaseOptions
```

Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from\_preset('granite\_vision')

#### ``queue\_max\_size`pydantic-field`

```
queue_max_size: int
```

Maximum queue size for inter-stage communication in threaded pipeline. Limits the number of items buffered between processing stages to prevent memory overflow. When full, upstream stages block until space is available. Only used by `StandardPdfPipeline` (threaded mode).

#### ``table\_batch\_size`pydantic-field`

```
table_batch_size: int
```

Batch size for table structure extraction stage in threaded pipeline. Tables from multiple pages are processed together. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).

#### ``table\_structure\_options`pydantic-field`

```
table_structure_options: BaseTableStructureOptions
```

Configuration for table structure extraction. Controls table detection accuracy, cell matching behavior, and table formatting. Only applicable when `do_table_structure=True`.

### ``PictureDescriptionApiOptions`pydantic-model`

Bases: `PictureDescriptionBaseOptions`

Configuration for API-based picture description services.

Show JSON schema:

```
{
  "$defs": {
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    }
  },
  "description": "Configuration for API-based picture description services.",
  "properties": {
    "batch_size": {
      "default": 8,
      "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
      "title": "Batch Size",
      "type": "integer"
    },
    "scale": {
      "default": 2.0,
      "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
      "title": "Scale",
      "type": "number"
    },
    "picture_area_threshold": {
      "default": 0.05,
      "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
      "title": "Picture Area Threshold",
      "type": "number"
    },
    "classification_allow": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
      "title": "Classification Allow"
    },
    "classification_deny": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
      "title": "Classification Deny"
    },
    "classification_min_confidence": {
      "default": 0.0,
      "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
      "title": "Classification Min Confidence",
      "type": "number"
    },
    "url": {
      "default": "http://localhost:8000/v1/chat/completions",
      "description": "API endpoint URL for picture description service. Must be OpenAI-compatible chat completions endpoint. Default points to local server; update for cloud services or custom deployments.",
      "format": "uri",
      "minLength": 1,
      "title": "Url",
      "type": "string"
    },
    "headers": {
      "additionalProperties": {
        "type": "string"
      },
      "default": {},
      "description": "HTTP headers to include in API requests. Use for authentication or custom headers required by your API service.",
      "examples": [\
        {\
          "Authorization": "Bearer TOKEN"\
        }\
      ],
      "title": "Headers",
      "type": "object"
    },
    "params": {
      "additionalProperties": true,
      "default": {},
      "description": "Additional query parameters to include in API requests. Service-specific parameters for customizing API behavior beyond standard options.",
      "title": "Params",
      "type": "object"
    },
    "timeout": {
      "default": 20.0,
      "description": "Maximum time in seconds to wait for API response before timing out. Increase for slow networks or complex image descriptions. Recommended: 10-60 seconds.",
      "title": "Timeout",
      "type": "number"
    },
    "concurrency": {
      "default": 1,
      "description": "Number of concurrent API requests allowed. Higher values improve throughput but may hit API rate limits. Adjust based on API service quotas and network capacity.",
      "title": "Concurrency",
      "type": "integer"
    },
    "prompt": {
      "default": "Describe this image in a few sentences.",
      "description": "Prompt template sent to the vision model for image description. Customize to guide the model's output style, detail level, or focus.",
      "examples": [\
        "Provide a technical description of this diagram"\
      ],
      "title": "Prompt",
      "type": "string"
    },
    "provenance": {
      "default": "",
      "description": "Provenance information to track the source or method of picture descriptions. Used for metadata and auditing purposes in the output document.",
      "title": "Provenance",
      "type": "string"
    }
  },
  "title": "PictureDescriptionApiOptions",
  "type": "object"
}
```

Fields:

- `batch_size`
(`int`)

- `scale`
(`float`)

- `picture_area_threshold`
(`float`)

- `classification_allow`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_deny`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_min_confidence`
(`float`)

- `url`
(`AnyUrl`)

- `headers`
(`dict[str, str]`)

- `params`
(`dict[str, Any]`)

- `timeout`
(`float`)

- `concurrency`
(`int`)

- `prompt`
(`str`)

- `provenance`
(`str`)


#### ``batch\_size`pydantic-field`

```
batch_size: int
```

Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.

#### ``classification\_allow`pydantic-field`

```
classification_allow: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).

#### ``classification\_deny`pydantic-field`

```
classification_deny: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).

#### ``classification\_min\_confidence`pydantic-field`

```
classification_min_confidence: float
```

Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).

#### ``concurrency`pydantic-field`

```
concurrency: int
```

Number of concurrent API requests allowed. Higher values improve throughput but may hit API rate limits. Adjust based on API service quotas and network capacity.

#### ``headers`pydantic-field`

```
headers: dict[str, str]
```

HTTP headers to include in API requests. Use for authentication or custom headers required by your API service.

#### ``kind`class-attribute`

```
kind: Literal['api'] = 'api'
```

#### ``params`pydantic-field`

```
params: dict[str, Any]
```

Additional query parameters to include in API requests. Service-specific parameters for customizing API behavior beyond standard options.

#### ``picture\_area\_threshold`pydantic-field`

```
picture_area_threshold: float
```

Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.

#### ``prompt`pydantic-field`

```
prompt: str
```

Prompt template sent to the vision model for image description. Customize to guide the model's output style, detail level, or focus.

#### ``provenance`pydantic-field`

```
provenance: str
```

Provenance information to track the source or method of picture descriptions. Used for metadata and auditing purposes in the output document.

#### ``scale`pydantic-field`

```
scale: float
```

Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.

#### ``timeout`pydantic-field`

```
timeout: float
```

Maximum time in seconds to wait for API response before timing out. Increase for slow networks or complex image descriptions. Recommended: 10-60 seconds.

#### ``url`pydantic-field`

```
url: AnyUrl
```

API endpoint URL for picture description service. Must be OpenAI-compatible chat completions endpoint. Default points to local server; update for cloud services or custom deployments.

### ``PictureDescriptionBaseOptions`pydantic-model`

Bases: `BaseOptions`

Base configuration for picture description models.

Show JSON schema:

```
{
  "$defs": {
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    }
  },
  "description": "Base configuration for picture description models.",
  "properties": {
    "batch_size": {
      "default": 8,
      "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
      "title": "Batch Size",
      "type": "integer"
    },
    "scale": {
      "default": 2.0,
      "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
      "title": "Scale",
      "type": "number"
    },
    "picture_area_threshold": {
      "default": 0.05,
      "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
      "title": "Picture Area Threshold",
      "type": "number"
    },
    "classification_allow": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
      "title": "Classification Allow"
    },
    "classification_deny": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
      "title": "Classification Deny"
    },
    "classification_min_confidence": {
      "default": 0.0,
      "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
      "title": "Classification Min Confidence",
      "type": "number"
    }
  },
  "title": "PictureDescriptionBaseOptions",
  "type": "object"
}
```

Fields:

- `batch_size`
(`int`)

- `scale`
(`float`)

- `picture_area_threshold`
(`float`)

- `classification_allow`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_deny`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_min_confidence`
(`float`)


#### ``batch\_size`pydantic-field`

```
batch_size: int
```

Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.

#### ``classification\_allow`pydantic-field`

```
classification_allow: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).

#### ``classification\_deny`pydantic-field`

```
classification_deny: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).

#### ``classification\_min\_confidence`pydantic-field`

```
classification_min_confidence: float
```

Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).

#### ``kind`class-attribute`

```
kind: str
```

#### ``picture\_area\_threshold`pydantic-field`

```
picture_area_threshold: float
```

Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.

#### ``scale`pydantic-field`

```
scale: float
```

Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.

### ``PictureDescriptionVlmEngineOptions`pydantic-model`

Bases: `StagePresetMixin`, `VlmEngineOptionsMixin`, `PictureDescriptionBaseOptions`

Configuration for VLM runtime-based picture description.

This is the new implementation that uses the pluggable runtime system with preset support.
Supports all runtime types (Transformers, MLX, API, etc.) through the unified runtime interface.

Use `from_preset()` to create instances from registered presets.

Examples:

#### Use preset with default runtime

options = PictureDescriptionVlmEngineOptions.from\_preset("smolvlm")

#### Use preset with runtime override

from docling.datamodel.vlm\_engine\_options import MlxVlmEngineOptions, VlmEngineType
options = PictureDescriptionVlmEngineOptions.from\_preset(
"smolvlm",
engine\_options=MlxVlmEngineOptions(engine\_type=VlmEngineType.MLX)
)

Show JSON schema:

```
{
  "$defs": {
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Configuration for VLM runtime-based picture description.\n\nThis is the new implementation that uses the pluggable runtime system with preset support.\nSupports all runtime types (Transformers, MLX, API, etc.) through the unified runtime interface.\n\nUse `from_preset()` to create instances from registered presets.\n\nExamples:\n    # Use preset with default runtime\n    options = PictureDescriptionVlmEngineOptions.from_preset(\"smolvlm\")\n\n    # Use preset with runtime override\n    from docling.datamodel.vlm_engine_options import MlxVlmEngineOptions, VlmEngineType\n    options = PictureDescriptionVlmEngineOptions.from_preset(\n        \"smolvlm\",\n        engine_options=MlxVlmEngineOptions(engine_type=VlmEngineType.MLX)\n    )",
  "properties": {
    "batch_size": {
      "default": 8,
      "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
      "title": "Batch Size",
      "type": "integer"
    },
    "scale": {
      "default": 2.0,
      "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
      "title": "Scale",
      "type": "number"
    },
    "picture_area_threshold": {
      "default": 0.05,
      "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
      "title": "Picture Area Threshold",
      "type": "number"
    },
    "classification_allow": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
      "title": "Classification Allow"
    },
    "classification_deny": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
      "title": "Classification Deny"
    },
    "classification_min_confidence": {
      "default": 0.0,
      "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
      "title": "Classification Min Confidence",
      "type": "number"
    },
    "engine_options": {
      "$ref": "#/$defs/BaseVlmEngineOptions",
      "description": "Runtime configuration (transformers, mlx, api, etc.)"
    },
    "model_spec": {
      "$ref": "#/$defs/VlmModelSpec",
      "description": "Model specification with runtime-specific overrides"
    },
    "prompt": {
      "default": "Describe this image in a few sentences.",
      "description": "Prompt template for the vision model. Customize to control description style, detail level, or focus.",
      "examples": [\
        "What is shown in this image?",\
        "Provide a detailed technical description"\
      ],
      "title": "Prompt",
      "type": "string"
    },
    "generation_config": {
      "additionalProperties": true,
      "default": {
        "max_new_tokens": 200,
        "do_sample": false
      },
      "description": "Generation configuration for text generation. Controls output length, sampling strategy, temperature, etc.",
      "title": "Generation Config",
      "type": "object"
    }
  },
  "required": [\
    "engine_options",\
    "model_spec"\
  ],
  "title": "PictureDescriptionVlmEngineOptions",
  "type": "object"
}
```

Fields:

- `batch_size`
(`int`)

- `scale`
(`float`)

- `picture_area_threshold`
(`float`)

- `classification_allow`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_deny`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_min_confidence`
(`float`)

- `engine_options`
(`BaseVlmEngineOptions`)

- `model_spec`
(`VlmModelSpec`)

- `prompt`
(`str`)

- `generation_config`
(`dict[str, Any]`)


#### ``batch\_size`pydantic-field`

```
batch_size: int
```

Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.

#### ``classification\_allow`pydantic-field`

```
classification_allow: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).

#### ``classification\_deny`pydantic-field`

```
classification_deny: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).

#### ``classification\_min\_confidence`pydantic-field`

```
classification_min_confidence: float
```

Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).

#### ``engine\_options`pydantic-field`

```
engine_options: BaseVlmEngineOptions
```

Runtime configuration (transformers, mlx, api, etc.)

#### ``generation\_config`pydantic-field`

```
generation_config: dict[str, Any]
```

Generation configuration for text generation. Controls output length, sampling strategy, temperature, etc.

#### ``kind`class-attribute`

```
kind: Literal['picture_description_vlm_engine'] = 'picture_description_vlm_engine'
```

#### ``model\_spec`pydantic-field`

```
model_spec: VlmModelSpec
```

Model specification with runtime-specific overrides

#### ``picture\_area\_threshold`pydantic-field`

```
picture_area_threshold: float
```

Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.

#### ``prompt`pydantic-field`

```
prompt: str
```

Prompt template for the vision model. Customize to control description style, detail level, or focus.

#### ``scale`pydantic-field`

```
scale: float
```

Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.

#### ``from\_preset`classmethod`

```
from_preset(preset_id: str, engine_options: Optional[BaseVlmEngineOptions] = None, **overrides)
```

Create options from a registered preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier

- **`engine_options`**
(`Optional[BaseVlmEngineOptions]`, default:
`None`
)
–



Optional engine override

- **`**overrides`**
–



Additional option overrides


Returns:

- –



Instance of the stage options class


#### ``get\_preset`classmethod`

```
get_preset(preset_id: str) -> StageModelPreset
```

Get a specific preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier


Returns:

- `StageModelPreset`
–



The requested preset


Raises:

- `KeyError`
–



If preset not found


#### ``get\_preset\_info`classmethod`

```
get_preset_info() -> List[Dict[str, str]]
```

Get summary info for all presets (useful for CLI).

Returns:

- `List[Dict[str, str]]`
–



List of dicts with preset\_id, name, description, model


#### ``list\_preset\_ids`classmethod`

```
list_preset_ids() -> List[str]
```

List all preset IDs for this stage.

Returns:

- `List[str]`
–



List of preset IDs


#### ``list\_presets`classmethod`

```
list_presets() -> List[StageModelPreset]
```

List all presets for this stage.

Returns:

- `List[StageModelPreset]`
–



List of presets


#### ``register\_preset`classmethod`

```
register_preset(preset: StageModelPreset) -> None
```

Register a preset for this stage options class.

Parameters:

- **`preset`**
(`StageModelPreset`)
–



The preset to register


Note

If preset ID already registered, it will be silently skipped.
This allows for idempotent registration at module import time.

#### ``resolve\_engine\_options`classmethod`

```
resolve_engine_options(value)
```

### ``PictureDescriptionVlmOptions`pydantic-model`

Bases: `PictureDescriptionBaseOptions`

Configuration for inline vision-language models for picture description.

This is the legacy implementation that uses direct HuggingFace Transformers integration.
For the new runtime-based system with preset support, use PictureDescriptionVlmEngineOptions.

Show JSON schema:

```
{
  "$defs": {
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    }
  },
  "description": "Configuration for inline vision-language models for picture description.\n\nThis is the legacy implementation that uses direct HuggingFace Transformers integration.\nFor the new runtime-based system with preset support, use PictureDescriptionVlmEngineOptions.",
  "properties": {
    "batch_size": {
      "default": 8,
      "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
      "title": "Batch Size",
      "type": "integer"
    },
    "scale": {
      "default": 2.0,
      "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
      "title": "Scale",
      "type": "number"
    },
    "picture_area_threshold": {
      "default": 0.05,
      "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
      "title": "Picture Area Threshold",
      "type": "number"
    },
    "classification_allow": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
      "title": "Classification Allow"
    },
    "classification_deny": {
      "anyOf": [\
        {\
          "items": {\
            "$ref": "#/$defs/PictureClassificationLabel"\
          },\
          "type": "array"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
      "title": "Classification Deny"
    },
    "classification_min_confidence": {
      "default": 0.0,
      "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
      "title": "Classification Min Confidence",
      "type": "number"
    },
    "repo_id": {
      "description": "HuggingFace model repository ID for the vision-language model. Must be a model capable of image-to-text generation for picture descriptions.",
      "examples": [\
        "HuggingFaceTB/SmolVLM-256M-Instruct",\
        "ibm-granite/granite-vision-3.3-2b"\
      ],
      "title": "Repo Id",
      "type": "string"
    },
    "prompt": {
      "default": "Describe this image in a few sentences.",
      "description": "Prompt template for the vision model. Customize to control description style, detail level, or focus.",
      "examples": [\
        "What is shown in this image?",\
        "Provide a detailed technical description"\
      ],
      "title": "Prompt",
      "type": "string"
    },
    "generation_config": {
      "additionalProperties": true,
      "default": {
        "max_new_tokens": 200,
        "do_sample": false
      },
      "description": "HuggingFace generation configuration for text generation. Controls output length, sampling strategy, temperature, etc. See: https://huggingface.co/docs/transformers/en/main_classes/text_generation#transformers.GenerationConfig",
      "title": "Generation Config",
      "type": "object"
    }
  },
  "required": [\
    "repo_id"\
  ],
  "title": "PictureDescriptionVlmOptions",
  "type": "object"
}
```

Fields:

- `batch_size`
(`int`)

- `scale`
(`float`)

- `picture_area_threshold`
(`float`)

- `classification_allow`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_deny`
(`Optional[list[PictureClassificationLabel]]`)

- `classification_min_confidence`
(`float`)

- `repo_id`
(`str`)

- `prompt`
(`str`)

- `generation_config`
(`dict[str, Any]`)


#### ``batch\_size`pydantic-field`

```
batch_size: int
```

Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.

#### ``classification\_allow`pydantic-field`

```
classification_allow: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).

#### ``classification\_deny`pydantic-field`

```
classification_deny: Optional[list[PictureClassificationLabel]]
```

List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).

#### ``classification\_min\_confidence`pydantic-field`

```
classification_min_confidence: float
```

Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).

#### ``generation\_config`pydantic-field`

```
generation_config: dict[str, Any]
```

HuggingFace generation configuration for text generation. Controls output length, sampling strategy, temperature, etc. See: https://huggingface.co/docs/transformers/en/main\_classes/text\_generation#transformers.GenerationConfig

#### ``kind`class-attribute`

```
kind: Literal['vlm'] = 'vlm'
```

#### ``picture\_area\_threshold`pydantic-field`

```
picture_area_threshold: float
```

Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.

#### ``prompt`pydantic-field`

```
prompt: str
```

Prompt template for the vision model. Customize to control description style, detail level, or focus.

#### ``repo\_cache\_folder`property`

```
repo_cache_folder: str
```

#### ``repo\_id`pydantic-field`

```
repo_id: str
```

HuggingFace model repository ID for the vision-language model. Must be a model capable of image-to-text generation for picture descriptions.

#### ``scale`pydantic-field`

```
scale: float
```

Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.

### ``PipelineOptions`pydantic-model`

Bases: `BaseOptions`

Base configuration for document processing pipelines.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    }
  },
  "description": "Base configuration for document processing pipelines.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    }
  },
  "title": "PipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``kind`class-attribute`

```
kind: str
```

### ``ProcessingPipeline

Bases: `str`, `Enum`

Available document processing pipeline types for different use cases.

Each pipeline is optimized for specific document types and processing requirements.
Select the appropriate pipeline based on your input format and desired output.

Attributes:

- **`LEGACY`**
–



Legacy pipeline for backward compatibility with older document processing workflows.

- **`STANDARD`**
–



Standard pipeline for general document processing (PDF, DOCX, images, etc.) with layout analysis.

- **`VLM`**
–



Vision-Language Model pipeline for advanced document understanding using multimodal AI models.

- **`ASR`**
–



Automatic Speech Recognition pipeline for audio and video transcription to text.


#### ``ASR`class-attribute``instance-attribute`

```
ASR = 'asr'
```

#### ``LEGACY`class-attribute``instance-attribute`

```
LEGACY = 'legacy'
```

#### ``STANDARD`class-attribute``instance-attribute`

```
STANDARD = 'standard'
```

#### ``VLM`class-attribute``instance-attribute`

```
VLM = 'vlm'
```

### ``RapidOcrOptions`pydantic-model`

Bases: `OcrOptions`

Configuration for RapidOCR engine with multiple backend support.

See Also

- https://rapidai.github.io/RapidOCRDocs/install\_usage/api/RapidOCR/
- https://rapidai.github.io/RapidOCRDocs/main/install\_usage/rapidocr/usage/#\_\_tabbed\_3\_4

Show JSON schema:

```
{
  "additionalProperties": false,
  "description": "Configuration for RapidOCR engine with multiple backend support.\n\nSee Also:\n    - https://rapidai.github.io/RapidOCRDocs/install_usage/api/RapidOCR/\n    - https://rapidai.github.io/RapidOCRDocs/main/install_usage/rapidocr/usage/#__tabbed_3_4",
  "properties": {
    "lang": {
      "default": [\
        "english",\
        "chinese"\
      ],
      "description": "List of OCR languages. Note: RapidOCR does not currently support language selection; this parameter is reserved for future compatibility. See RapidOCR documentation for supported languages.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    },
    "backend": {
      "default": "onnxruntime",
      "description": "Inference backend for RapidOCR. Options: `onnxruntime` (default, cross-platform), `openvino` (Intel), `paddle` (PaddlePaddle), `torch` (PyTorch). Choose based on your hardware and available libraries.",
      "enum": [\
        "onnxruntime",\
        "openvino",\
        "paddle",\
        "torch"\
      ],
      "title": "Backend",
      "type": "string"
    },
    "text_score": {
      "default": 0.5,
      "description": "Minimum confidence score for text detection. Text regions with scores below this threshold are filtered out. Range: 0.0-1.0. Lower values detect more text but may include false positives.",
      "title": "Text Score",
      "type": "number"
    },
    "use_det": {
      "anyOf": [\
        {\
          "type": "boolean"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Enable text detection stage. If None, uses RapidOCR default behavior.",
      "title": "Use Det"
    },
    "use_cls": {
      "anyOf": [\
        {\
          "type": "boolean"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Enable text direction classification stage. If None, uses RapidOCR default behavior.",
      "title": "Use Cls"
    },
    "use_rec": {
      "anyOf": [\
        {\
          "type": "boolean"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Enable text recognition stage. If None, uses RapidOCR default behavior.",
      "title": "Use Rec"
    },
    "print_verbose": {
      "default": false,
      "description": "Enable verbose logging output from RapidOCR for debugging purposes.",
      "title": "Print Verbose",
      "type": "boolean"
    },
    "det_model_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Custom path to text detection model. If None, uses default RapidOCR model.",
      "title": "Det Model Path"
    },
    "cls_model_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Custom path to text classification model. If None, uses default RapidOCR model.",
      "title": "Cls Model Path"
    },
    "rec_model_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Custom path to text recognition model. If None, uses default RapidOCR model.",
      "title": "Rec Model Path"
    },
    "rec_keys_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Custom path to recognition keys file. If None, uses default RapidOCR keys.",
      "title": "Rec Keys Path"
    },
    "rec_font_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "deprecated": true,
      "description": "Deprecated. Use font_path instead.",
      "title": "Rec Font Path"
    },
    "font_path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Custom path to font file for text rendering in visualization.",
      "title": "Font Path"
    },
    "rapidocr_params": {
      "additionalProperties": true,
      "default": {},
      "description": "Additional parameters to pass through to RapidOCR engine. Use this to override or extend default RapidOCR configuration with engine-specific options.",
      "title": "Rapidocr Params",
      "type": "object"
    }
  },
  "title": "RapidOcrOptions",
  "type": "object"
}
```

Config:

- `extra`: `forbid`

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)

- `backend`
(`Literal['onnxruntime', 'openvino', 'paddle', 'torch']`)

- `text_score`
(`float`)

- `use_det`
(`Optional[bool]`)

- `use_cls`
(`Optional[bool]`)

- `use_rec`
(`Optional[bool]`)

- `print_verbose`
(`bool`)

- `det_model_path`
(`Optional[str]`)

- `cls_model_path`
(`Optional[str]`)

- `rec_model_path`
(`Optional[str]`)

- `rec_keys_path`
(`Optional[str]`)

- `rec_font_path`
(`Optional[str]`)

- `font_path`
(`Optional[str]`)

- `rapidocr_params`
(`dict[str, Any]`)


#### ``backend`pydantic-field`

```
backend: Literal['onnxruntime', 'openvino', 'paddle', 'torch']
```

Inference backend for RapidOCR. Options: `onnxruntime` (default, cross-platform), `openvino` (Intel), `paddle` (PaddlePaddle), `torch` (PyTorch). Choose based on your hardware and available libraries.

#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``cls\_model\_path`pydantic-field`

```
cls_model_path: Optional[str]
```

Custom path to text classification model. If None, uses default RapidOCR model.

#### ``det\_model\_path`pydantic-field`

```
det_model_path: Optional[str]
```

Custom path to text detection model. If None, uses default RapidOCR model.

#### ``font\_path`pydantic-field`

```
font_path: Optional[str]
```

Custom path to font file for text rendering in visualization.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: Literal['rapidocr'] = 'rapidocr'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of OCR languages. Note: RapidOCR does not currently support language selection; this parameter is reserved for future compatibility. See RapidOCR documentation for supported languages.

#### ``model\_config`class-attribute``instance-attribute`

```
model_config = ConfigDict(extra='forbid')
```

#### ``print\_verbose`pydantic-field`

```
print_verbose: bool
```

Enable verbose logging output from RapidOCR for debugging purposes.

#### ``rapidocr\_params`pydantic-field`

```
rapidocr_params: dict[str, Any]
```

Additional parameters to pass through to RapidOCR engine. Use this to override or extend default RapidOCR configuration with engine-specific options.

#### ``rec\_font\_path`pydantic-field`

```
rec_font_path: Optional[str]
```

Deprecated. Use font\_path instead.

#### ``rec\_keys\_path`pydantic-field`

```
rec_keys_path: Optional[str]
```

Custom path to recognition keys file. If None, uses default RapidOCR keys.

#### ``rec\_model\_path`pydantic-field`

```
rec_model_path: Optional[str]
```

Custom path to text recognition model. If None, uses default RapidOCR model.

#### ``text\_score`pydantic-field`

```
text_score: float
```

Minimum confidence score for text detection. Text regions with scores below this threshold are filtered out. Range: 0.0-1.0. Lower values detect more text but may include false positives.

#### ``use\_cls`pydantic-field`

```
use_cls: Optional[bool]
```

Enable text direction classification stage. If None, uses RapidOCR default behavior.

#### ``use\_det`pydantic-field`

```
use_det: Optional[bool]
```

Enable text detection stage. If None, uses RapidOCR default behavior.

#### ``use\_rec`pydantic-field`

```
use_rec: Optional[bool]
```

Enable text recognition stage. If None, uses RapidOCR default behavior.

### ``TableFormerMode

Bases: `str`, `Enum`

Operating modes for TableFormer table structure extraction model.

Controls the trade-off between processing speed and extraction accuracy.
Choose based on your performance requirements and document complexity.

Attributes:

- **`FAST`**
–



Fast mode prioritizes speed over precision. Suitable for simple tables or high-volume
processing.

- **`ACCURATE`**
–



Accurate mode provides higher quality results with slower processing. Recommended for complex
tables and production use.


#### ``ACCURATE`class-attribute``instance-attribute`

```
ACCURATE = 'accurate'
```

#### ``FAST`class-attribute``instance-attribute`

```
FAST = 'fast'
```

### ``TableStructureOptions`pydantic-model`

Bases: `BaseTableStructureOptions`

Configuration for table structure extraction using the TableFormer model.

Show JSON schema:

```
{
  "$defs": {
    "TableFormerMode": {
      "description": "Operating modes for TableFormer table structure extraction model.\n\nControls the trade-off between processing speed and extraction accuracy.\nChoose based on your performance requirements and document complexity.\n\nAttributes:\n    FAST: Fast mode prioritizes speed over precision. Suitable for simple tables or high-volume\n        processing.\n    ACCURATE: Accurate mode provides higher quality results with slower processing. Recommended for complex\n        tables and production use.",
      "enum": [\
        "fast",\
        "accurate"\
      ],
      "title": "TableFormerMode",
      "type": "string"
    }
  },
  "description": "Configuration for table structure extraction using the TableFormer model.",
  "properties": {
    "do_cell_matching": {
      "default": true,
      "description": "Enable cell matching to align detected table cells with their content. When enabled, the model attempts to match table structure predictions with actual cell content for improved accuracy.",
      "title": "Do Cell Matching",
      "type": "boolean"
    },
    "mode": {
      "$ref": "#/$defs/TableFormerMode",
      "default": "accurate",
      "description": "Table structure extraction mode. `accurate` provides higher quality results with slower processing, while `fast` prioritizes speed over precision. Recommended: `accurate` for production use."
    }
  },
  "title": "TableStructureOptions",
  "type": "object"
}
```

Fields:

- `do_cell_matching`
(`bool`)

- `mode`
(`TableFormerMode`)


#### ``do\_cell\_matching`pydantic-field`

```
do_cell_matching: bool
```

Enable cell matching to align detected table cells with their content. When enabled, the model attempts to match table structure predictions with actual cell content for improved accuracy.

#### ``kind`class-attribute`

```
kind: str = 'docling_tableformer'
```

#### ``mode`pydantic-field`

```
mode: TableFormerMode
```

Table structure extraction mode. `accurate` provides higher quality results with slower processing, while `fast` prioritizes speed over precision. Recommended: `accurate` for production use.

### ``TesseractCliOcrOptions`pydantic-model`

Bases: `OcrOptions`

Configuration for Tesseract OCR via command-line interface.

Show JSON schema:

```
{
  "additionalProperties": false,
  "description": "Configuration for Tesseract OCR via command-line interface.",
  "properties": {
    "lang": {
      "default": [\
        "fra",\
        "deu",\
        "spa",\
        "eng"\
      ],
      "description": "List of Tesseract language codes. Use 3-letter ISO 639-2 codes (e.g., `eng`, `fra`, `deu`). Multiple languages enable multilingual OCR. Requires corresponding Tesseract language data files.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    },
    "tesseract_cmd": {
      "default": "tesseract",
      "description": "Command or path to Tesseract executable. Use `tesseract` if in system PATH, or provide full path for custom installations (e.g., `/usr/local/bin/tesseract`).",
      "title": "Tesseract Cmd",
      "type": "string"
    },
    "path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Path to Tesseract data directory containing language files. If None, uses Tesseract's default TESSDATA_PREFIX location.",
      "title": "Path"
    },
    "psm": {
      "anyOf": [\
        {\
          "type": "integer"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Page Segmentation Mode for Tesseract. Values 0-13 control how Tesseract segments the page. Common values: 3 (auto), 6 (uniform block), 11 (sparse text). If None, uses Tesseract default.",
      "title": "Psm"
    }
  },
  "title": "TesseractCliOcrOptions",
  "type": "object"
}
```

Config:

- `extra`: `forbid`

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)

- `tesseract_cmd`
(`str`)

- `path`
(`Optional[str]`)

- `psm`
(`Optional[int]`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: Literal['tesseract'] = 'tesseract'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of Tesseract language codes. Use 3-letter ISO 639-2 codes (e.g., `eng`, `fra`, `deu`). Multiple languages enable multilingual OCR. Requires corresponding Tesseract language data files.

#### ``model\_config`class-attribute``instance-attribute`

```
model_config = ConfigDict(extra='forbid')
```

#### ``path`pydantic-field`

```
path: Optional[str]
```

Path to Tesseract data directory containing language files. If None, uses Tesseract's default TESSDATA\_PREFIX location.

#### ``psm`pydantic-field`

```
psm: Optional[int]
```

Page Segmentation Mode for Tesseract. Values 0-13 control how Tesseract segments the page. Common values: 3 (auto), 6 (uniform block), 11 (sparse text). If None, uses Tesseract default.

#### ``tesseract\_cmd`pydantic-field`

```
tesseract_cmd: str
```

Command or path to Tesseract executable. Use `tesseract` if in system PATH, or provide full path for custom installations (e.g., `/usr/local/bin/tesseract`).

### ``TesseractOcrOptions`pydantic-model`

Bases: `OcrOptions`

Configuration for Tesseract OCR via Python bindings (tesserocr).

Show JSON schema:

```
{
  "additionalProperties": false,
  "description": "Configuration for Tesseract OCR via Python bindings (tesserocr).",
  "properties": {
    "lang": {
      "default": [\
        "fra",\
        "deu",\
        "spa",\
        "eng"\
      ],
      "description": "List of Tesseract language codes. Use 3-letter ISO 639-2 codes (e.g., `eng`, `fra`, `deu`). Multiple languages enable multilingual OCR. Requires corresponding Tesseract language data files.",
      "items": {
        "type": "string"
      },
      "title": "Lang",
      "type": "array"
    },
    "force_full_page_ocr": {
      "default": false,
      "description": "If enabled, a full-page OCR is always applied.",
      "examples": [\
        false\
      ],
      "title": "Force Full Page Ocr",
      "type": "boolean"
    },
    "bitmap_area_threshold": {
      "default": 0.05,
      "description": "Percentage of the page area for a bitmap to be processed with OCR.",
      "examples": [\
        0.05,\
        0.1\
      ],
      "title": "Bitmap Area Threshold",
      "type": "number"
    },
    "path": {
      "anyOf": [\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Path to Tesseract data directory containing language files. If None, uses Tesseract's default TESSDATA_PREFIX location.",
      "title": "Path"
    },
    "psm": {
      "anyOf": [\
        {\
          "type": "integer"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Page Segmentation Mode for Tesseract. Values 0-13 control how Tesseract segments the page. Common values: 3 (auto), 6 (uniform block), 11 (sparse text). If None, uses Tesseract default.",
      "title": "Psm"
    }
  },
  "title": "TesseractOcrOptions",
  "type": "object"
}
```

Config:

- `extra`: `forbid`

Fields:

- `force_full_page_ocr`
(`bool`)

- `bitmap_area_threshold`
(`float`)

- `lang`
(`list[str]`)

- `path`
(`Optional[str]`)

- `psm`
(`Optional[int]`)


#### ``bitmap\_area\_threshold`pydantic-field`

```
bitmap_area_threshold: float
```

Percentage of the page area for a bitmap to be processed with OCR.

#### ``force\_full\_page\_ocr`pydantic-field`

```
force_full_page_ocr: bool
```

If enabled, a full-page OCR is always applied.

#### ``kind`class-attribute`

```
kind: Literal['tesserocr'] = 'tesserocr'
```

#### ``lang`pydantic-field`

```
lang: list[str]
```

List of Tesseract language codes. Use 3-letter ISO 639-2 codes (e.g., `eng`, `fra`, `deu`). Multiple languages enable multilingual OCR. Requires corresponding Tesseract language data files.

#### ``model\_config`class-attribute``instance-attribute`

```
model_config = ConfigDict(extra='forbid')
```

#### ``path`pydantic-field`

```
path: Optional[str]
```

Path to Tesseract data directory containing language files. If None, uses Tesseract's default TESSDATA\_PREFIX location.

#### ``psm`pydantic-field`

```
psm: Optional[int]
```

Page Segmentation Mode for Tesseract. Values 0-13 control how Tesseract segments the page. Common values: 3 (auto), 6 (uniform block), 11 (sparse text). If None, uses Tesseract default.

### ``ThreadedPdfPipelineOptions`pydantic-model`

Bases: `PdfPipelineOptions`

Pipeline options for the threaded PDF pipeline with batching and backpressure control

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseLayoutOptions": {
      "description": "Base options for layout models.",
      "properties": {
        "keep_empty_clusters": {
          "default": false,
          "description": "Retain empty clusters in layout analysis results. When False, clusters without content are removed. Enable for debugging or when empty regions are semantically important.",
          "title": "Keep Empty Clusters",
          "type": "boolean"
        },
        "skip_cell_assignment": {
          "default": false,
          "description": "Skip assignment of cells to table structures during layout analysis. When True, cells are detected but not associated with tables. Use for performance optimization when table structure is not needed.",
          "title": "Skip Cell Assignment",
          "type": "boolean"
        }
      },
      "title": "BaseLayoutOptions",
      "type": "object"
    },
    "BaseTableStructureOptions": {
      "description": "Base options for table structure models.",
      "properties": {},
      "title": "BaseTableStructureOptions",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "CodeFormulaVlmOptions": {
      "description": "Configuration for VLM-based code and formula extraction.\n\nThis stage uses vision-language models to extract code blocks and\nmathematical formulas from document images. Supports preset-based\nconfiguration via StagePresetMixin.\n\nExamples:\n    # Use CodeFormulaV2 preset\n    options = CodeFormulaVlmOptions.from_preset(\"codeformulav2\")\n\n    # Use Granite Docling preset\n    options = CodeFormulaVlmOptions.from_preset(\"granite_docling\")",
      "properties": {
        "engine_options": {
          "$ref": "#/$defs/BaseVlmEngineOptions",
          "description": "Runtime configuration (transformers, mlx, api, etc.)"
        },
        "model_spec": {
          "$ref": "#/$defs/VlmModelSpec",
          "description": "Model specification with runtime-specific overrides"
        },
        "scale": {
          "default": 2.0,
          "description": "Image scaling factor for preprocessing",
          "title": "Scale",
          "type": "number"
        },
        "max_size": {
          "anyOf": [\
            {\
              "type": "integer"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Maximum image dimension (width or height)",
          "title": "Max Size"
        },
        "extract_code": {
          "default": true,
          "description": "Extract code blocks",
          "title": "Extract Code",
          "type": "boolean"
        },
        "extract_formulas": {
          "default": true,
          "description": "Extract mathematical formulas",
          "title": "Extract Formulas",
          "type": "boolean"
        }
      },
      "required": [\
        "engine_options",\
        "model_spec"\
      ],
      "title": "CodeFormulaVlmOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "OcrOptions": {
      "description": "OCR options.",
      "properties": {
        "lang": {
          "description": "List of OCR languages to use. The format must match the values of the OCR engine of choice.",
          "examples": [\
            [\
              "deu",\
              "eng"\
            ]\
          ],
          "items": {
            "type": "string"
          },
          "title": "Lang",
          "type": "array"
        },
        "force_full_page_ocr": {
          "default": false,
          "description": "If enabled, a full-page OCR is always applied.",
          "examples": [\
            false\
          ],
          "title": "Force Full Page Ocr",
          "type": "boolean"
        },
        "bitmap_area_threshold": {
          "default": 0.05,
          "description": "Percentage of the page area for a bitmap to be processed with OCR.",
          "examples": [\
            0.05,\
            0.1\
          ],
          "title": "Bitmap Area Threshold",
          "type": "number"
        }
      },
      "required": [\
        "lang"\
      ],
      "title": "OcrOptions",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "PictureDescriptionBaseOptions": {
      "description": "Base configuration for picture description models.",
      "properties": {
        "batch_size": {
          "default": 8,
          "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
          "title": "Batch Size",
          "type": "integer"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "picture_area_threshold": {
          "default": 0.05,
          "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
          "title": "Picture Area Threshold",
          "type": "number"
        },
        "classification_allow": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
          "title": "Classification Allow"
        },
        "classification_deny": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
          "title": "Classification Deny"
        },
        "classification_min_confidence": {
          "default": 0.0,
          "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
          "title": "Classification Min Confidence",
          "type": "number"
        }
      },
      "title": "PictureDescriptionBaseOptions",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Pipeline options for the threaded PDF pipeline with batching and backpressure control",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "do_picture_classification": {
      "default": false,
      "description": "Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.",
      "title": "Do Picture Classification",
      "type": "boolean"
    },
    "do_picture_description": {
      "default": false,
      "description": "Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.",
      "title": "Do Picture Description",
      "type": "boolean"
    },
    "picture_description_options": {
      "$ref": "#/$defs/PictureDescriptionBaseOptions",
      "default": {
        "batch_size": 8,
        "scale": 2.0,
        "picture_area_threshold": 0.05,
        "classification_allow": null,
        "classification_deny": null,
        "classification_min_confidence": 0.0,
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_lmstudio": {
              "params": {
                "model": "smolvlm-256m-instruct"
              }
            }
          },
          "default_repo_id": "HuggingFaceTB/SmolVLM-256M-Instruct",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "moot20/SmolVLM-256M-Instruct-MLX",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": "bfloat16"
            }
          },
          "max_new_tokens": 4096,
          "name": "SmolVLM-256M-Instruct",
          "prompt": "Describe this image in a few sentences.",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "prompt": "Describe this image in a few sentences.",
        "generation_config": {
          "do_sample": false,
          "max_new_tokens": 200
        }
      },
      "description": "Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from_preset('granite_vision')"
    },
    "do_chart_extraction": {
      "default": false,
      "title": "Do Chart Extraction",
      "type": "boolean"
    },
    "images_scale": {
      "default": 1.0,
      "description": "Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).",
      "title": "Images Scale",
      "type": "number"
    },
    "generate_page_images": {
      "default": false,
      "description": "Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.",
      "title": "Generate Page Images",
      "type": "boolean"
    },
    "generate_picture_images": {
      "default": false,
      "description": "Extract and save embedded images from the PDF. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.",
      "title": "Generate Picture Images",
      "type": "boolean"
    },
    "do_table_structure": {
      "default": true,
      "description": "Enable table structure extraction and reconstruction. Detects table regions, extracts cell content with row/column relationships, and reconstructs the logical table structure for downstream processing.",
      "title": "Do Table Structure",
      "type": "boolean"
    },
    "do_ocr": {
      "default": true,
      "description": "Enable Optical Character Recognition for scanned or image-based PDFs. Replaces or supplements programmatic text extraction with OCR-detected text. Required for scanned documents with no embedded text layer. Note: OCR significantly increases processing time.",
      "title": "Do Ocr",
      "type": "boolean"
    },
    "do_code_enrichment": {
      "default": false,
      "description": "Enable specialized processing for code blocks. Applies code-aware OCR and formatting to improve accuracy of programming language snippets, terminal output, and structured code content.",
      "title": "Do Code Enrichment",
      "type": "boolean"
    },
    "do_formula_enrichment": {
      "default": false,
      "description": "Enable mathematical formula recognition and LaTeX conversion. Uses specialized models to detect and extract mathematical expressions, converting them to LaTeX format for accurate representation.",
      "title": "Do Formula Enrichment",
      "type": "boolean"
    },
    "force_backend_text": {
      "default": false,
      "description": "Force use of PDF backend's native text extraction instead of layout model predictions. When enabled, bypasses the layout model's text detection and uses the embedded text from the PDF file directly. Useful for PDFs with reliable programmatic text layers.",
      "title": "Force Backend Text",
      "type": "boolean"
    },
    "table_structure_options": {
      "$ref": "#/$defs/BaseTableStructureOptions",
      "default": {
        "do_cell_matching": true,
        "mode": "accurate"
      },
      "description": "Configuration for table structure extraction. Controls table detection accuracy, cell matching behavior, and table formatting. Only applicable when `do_table_structure=True`."
    },
    "ocr_options": {
      "$ref": "#/$defs/OcrOptions",
      "default": {
        "lang": [],
        "force_full_page_ocr": false,
        "bitmap_area_threshold": 0.05
      },
      "description": "Configuration for OCR engine. Specifies which OCR engine to use (Tesseract, EasyOCR, RapidOCR, etc.) and engine-specific settings. Only applicable when `do_ocr=True`."
    },
    "layout_options": {
      "$ref": "#/$defs/BaseLayoutOptions",
      "default": {
        "keep_empty_clusters": false,
        "skip_cell_assignment": false,
        "create_orphan_clusters": true,
        "model_spec": {
          "model_path": "",
          "name": "docling_layout_heron",
          "repo_id": "docling-project/docling-layout-heron",
          "revision": "main",
          "supported_devices": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ]
        }
      },
      "description": "Configuration for document layout analysis model. Controls layout detection behavior including cluster creation for orphaned elements, cell assignment to table structures, and handling of empty regions. Specifies which layout model to use (default: Heron)."
    },
    "code_formula_options": {
      "$ref": "#/$defs/CodeFormulaVlmOptions",
      "default": {
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {},
          "default_repo_id": "docling-project/CodeFormulaV2",
          "engine_overrides": {
            "transformers": {
              "extra_config": {
                "extra_generation_config": {
                  "skip_special_tokens": false
                },
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": null
            }
          },
          "max_new_tokens": 4096,
          "name": "CodeFormulaV2",
          "prompt": "",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [\
            "</doctag>",\
            "<end_of_utterance>"\
          ],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "scale": 2.0,
        "max_size": null,
        "extract_code": true,
        "extract_formulas": true
      },
      "description": "Configuration for code and formula extraction using VLM. Uses new preset system (recommended). Default: 'default' preset. Only applicable when `do_code_enrichment=True` or `do_formula_enrichment=True`. Example: CodeFormulaVlmOptions.from_preset('granite_vision')"
    },
    "generate_table_images": {
      "default": false,
      "deprecated": true,
      "title": "Generate Table Images",
      "type": "boolean"
    },
    "generate_parsed_pages": {
      "default": false,
      "description": "Retain intermediate parsed page representations after processing. When enabled, keeps detailed page-level parsing data structures for debugging or advanced post-processing. Increases memory usage. Automatically disabled after document assembly unless explicitly enabled.",
      "title": "Generate Parsed Pages",
      "type": "boolean"
    },
    "ocr_batch_size": {
      "default": 4,
      "description": "Batch size for OCR processing stage in threaded pipeline. Pages are grouped and processed together to improve throughput. Higher values increase GPU/CPU utilization but require more memory. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Ocr Batch Size",
      "type": "integer"
    },
    "layout_batch_size": {
      "default": 4,
      "description": "Batch size for layout analysis stage in threaded pipeline. Pages are grouped and processed together by the layout model. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Layout Batch Size",
      "type": "integer"
    },
    "table_batch_size": {
      "default": 4,
      "description": "Batch size for table structure extraction stage in threaded pipeline. Tables from multiple pages are processed together. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Table Batch Size",
      "type": "integer"
    },
    "batch_polling_interval_seconds": {
      "default": 0.5,
      "description": "Polling interval in seconds for batch collection in threaded pipeline stages. Each stage waits up to this duration to accumulate items before processing. Lower values reduce latency but may decrease batching efficiency. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Batch Polling Interval Seconds",
      "type": "number"
    },
    "queue_max_size": {
      "default": 100,
      "description": "Maximum queue size for inter-stage communication in threaded pipeline. Limits the number of items buffered between processing stages to prevent memory overflow. When full, upstream stages block until space is available. Only used by `StandardPdfPipeline` (threaded mode).",
      "title": "Queue Max Size",
      "type": "integer"
    }
  },
  "title": "ThreadedPdfPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `do_picture_classification`
(`bool`)

- `do_picture_description`
(`bool`)

- `picture_description_options`
(`PictureDescriptionBaseOptions`)

- `do_chart_extraction`
(`bool`)

- `images_scale`
(`float`)

- `generate_page_images`
(`bool`)

- `generate_picture_images`
(`bool`)

- `do_table_structure`
(`bool`)

- `do_ocr`
(`bool`)

- `do_code_enrichment`
(`bool`)

- `do_formula_enrichment`
(`bool`)

- `force_backend_text`
(`bool`)

- `table_structure_options`
(`BaseTableStructureOptions`)

- `ocr_options`
(`OcrOptions`)

- `layout_options`
(`BaseLayoutOptions`)

- `code_formula_options`
(`CodeFormulaVlmOptions`)

- `generate_table_images`
(`bool`)

- `generate_parsed_pages`
(`bool`)

- `ocr_batch_size`
(`int`)

- `layout_batch_size`
(`int`)

- `table_batch_size`
(`int`)

- `batch_polling_interval_seconds`
(`float`)

- `queue_max_size`
(`int`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``batch\_polling\_interval\_seconds`pydantic-field`

```
batch_polling_interval_seconds: float
```

Polling interval in seconds for batch collection in threaded pipeline stages. Each stage waits up to this duration to accumulate items before processing. Lower values reduce latency but may decrease batching efficiency. Only used by `StandardPdfPipeline` (threaded mode).

#### ``code\_formula\_options`pydantic-field`

```
code_formula_options: CodeFormulaVlmOptions
```

Configuration for code and formula extraction using VLM. Uses new preset system (recommended). Default: 'default' preset. Only applicable when `do_code_enrichment=True` or `do_formula_enrichment=True`. Example: CodeFormulaVlmOptions.from\_preset('granite\_vision')

#### ``do\_chart\_extraction`pydantic-field`

```
do_chart_extraction: bool = False
```

#### ``do\_code\_enrichment`pydantic-field`

```
do_code_enrichment: bool
```

Enable specialized processing for code blocks. Applies code-aware OCR and formatting to improve accuracy of programming language snippets, terminal output, and structured code content.

#### ``do\_formula\_enrichment`pydantic-field`

```
do_formula_enrichment: bool
```

Enable mathematical formula recognition and LaTeX conversion. Uses specialized models to detect and extract mathematical expressions, converting them to LaTeX format for accurate representation.

#### ``do\_ocr`pydantic-field`

```
do_ocr: bool
```

Enable Optical Character Recognition for scanned or image-based PDFs. Replaces or supplements programmatic text extraction with OCR-detected text. Required for scanned documents with no embedded text layer. Note: OCR significantly increases processing time.

#### ``do\_picture\_classification`pydantic-field`

```
do_picture_classification: bool
```

Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.

#### ``do\_picture\_description`pydantic-field`

```
do_picture_description: bool
```

Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.

#### ``do\_table\_structure`pydantic-field`

```
do_table_structure: bool
```

Enable table structure extraction and reconstruction. Detects table regions, extracts cell content with row/column relationships, and reconstructs the logical table structure for downstream processing.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``force\_backend\_text`pydantic-field`

```
force_backend_text: bool
```

Force use of PDF backend's native text extraction instead of layout model predictions. When enabled, bypasses the layout model's text detection and uses the embedded text from the PDF file directly. Useful for PDFs with reliable programmatic text layers.

#### ``generate\_page\_images`pydantic-field`

```
generate_page_images: bool
```

Generate rendered page images during extraction. Creates PNG representations of each page for visual preview, validation, or downstream image-based machine learning tasks.

#### ``generate\_parsed\_pages`pydantic-field`

```
generate_parsed_pages: bool
```

Retain intermediate parsed page representations after processing. When enabled, keeps detailed page-level parsing data structures for debugging or advanced post-processing. Increases memory usage. Automatically disabled after document assembly unless explicitly enabled.

#### ``generate\_picture\_images`pydantic-field`

```
generate_picture_images: bool
```

Extract and save embedded images from the PDF. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.

#### ``generate\_table\_images`pydantic-field`

```
generate_table_images: bool
```

#### ``images\_scale`pydantic-field`

```
images_scale: float
```

Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).

#### ``kind`class-attribute`

```
kind: str
```

#### ``layout\_batch\_size`pydantic-field`

```
layout_batch_size: int
```

Batch size for layout analysis stage in threaded pipeline. Pages are grouped and processed together by the layout model. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).

#### ``layout\_options`pydantic-field`

```
layout_options: BaseLayoutOptions
```

Configuration for document layout analysis model. Controls layout detection behavior including cluster creation for orphaned elements, cell assignment to table structures, and handling of empty regions. Specifies which layout model to use (default: Heron).

#### ``ocr\_batch\_size`pydantic-field`

```
ocr_batch_size: int
```

Batch size for OCR processing stage in threaded pipeline. Pages are grouped and processed together to improve throughput. Higher values increase GPU/CPU utilization but require more memory. Only used by `StandardPdfPipeline` (threaded mode).

#### ``ocr\_options`pydantic-field`

```
ocr_options: OcrOptions
```

Configuration for OCR engine. Specifies which OCR engine to use (Tesseract, EasyOCR, RapidOCR, etc.) and engine-specific settings. Only applicable when `do_ocr=True`.

#### ``picture\_description\_options`pydantic-field`

```
picture_description_options: PictureDescriptionBaseOptions
```

Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from\_preset('granite\_vision')

#### ``queue\_max\_size`pydantic-field`

```
queue_max_size: int
```

Maximum queue size for inter-stage communication in threaded pipeline. Limits the number of items buffered between processing stages to prevent memory overflow. When full, upstream stages block until space is available. Only used by `StandardPdfPipeline` (threaded mode).

#### ``table\_batch\_size`pydantic-field`

```
table_batch_size: int
```

Batch size for table structure extraction stage in threaded pipeline. Tables from multiple pages are processed together. Higher values improve throughput but increase memory usage. Only used by `StandardPdfPipeline` (threaded mode).

#### ``table\_structure\_options`pydantic-field`

```
table_structure_options: BaseTableStructureOptions
```

Configuration for table structure extraction. Controls table detection accuracy, cell matching behavior, and table formatting. Only applicable when `do_table_structure=True`.

### ``VlmConvertOptions`pydantic-model`

Bases: `StagePresetMixin`, `VlmEngineOptionsMixin`, `BaseModel`

Configuration for VLM-based document conversion.

This stage uses vision-language models to convert document pages to
structured formats (DocTags, Markdown, etc.). Supports preset-based
configuration via StagePresetMixin.

Examples:

#### Use preset with default runtime

options = VlmConvertOptions.from\_preset("smoldocling")

#### Use preset with runtime override

from docling.datamodel.vlm\_engine\_options import ApiVlmEngineOptions, VlmEngineType
options = VlmConvertOptions.from\_preset(
"smoldocling",
engine\_options=ApiVlmEngineOptions(engine\_type=VlmEngineType.API\_OLLAMA)
)

Show JSON schema:

```
{
  "$defs": {
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Configuration for VLM-based document conversion.\n\nThis stage uses vision-language models to convert document pages to\nstructured formats (DocTags, Markdown, etc.). Supports preset-based\nconfiguration via StagePresetMixin.\n\nExamples:\n    # Use preset with default runtime\n    options = VlmConvertOptions.from_preset(\"smoldocling\")\n\n    # Use preset with runtime override\n    from docling.datamodel.vlm_engine_options import ApiVlmEngineOptions, VlmEngineType\n    options = VlmConvertOptions.from_preset(\n        \"smoldocling\",\n        engine_options=ApiVlmEngineOptions(engine_type=VlmEngineType.API_OLLAMA)\n    )",
  "properties": {
    "engine_options": {
      "$ref": "#/$defs/BaseVlmEngineOptions",
      "description": "Runtime configuration (transformers, mlx, api, etc.)"
    },
    "model_spec": {
      "$ref": "#/$defs/VlmModelSpec",
      "description": "Model specification with runtime-specific overrides"
    },
    "scale": {
      "default": 2.0,
      "description": "Image scaling factor for preprocessing",
      "title": "Scale",
      "type": "number"
    },
    "max_size": {
      "anyOf": [\
        {\
          "type": "integer"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum image dimension (width or height)",
      "title": "Max Size"
    },
    "batch_size": {
      "default": 1,
      "description": "Batch size for processing multiple pages",
      "title": "Batch Size",
      "type": "integer"
    },
    "force_backend_text": {
      "default": false,
      "description": "Force use of backend text extraction instead of VLM",
      "title": "Force Backend Text",
      "type": "boolean"
    }
  },
  "required": [\
    "engine_options",\
    "model_spec"\
  ],
  "title": "VlmConvertOptions",
  "type": "object"
}
```

Fields:

- `engine_options`
(`BaseVlmEngineOptions`)

- `model_spec`
(`VlmModelSpec`)

- `scale`
(`float`)

- `max_size`
(`Optional[int]`)

- `batch_size`
(`int`)

- `force_backend_text`
(`bool`)


#### ``batch\_size`pydantic-field`

```
batch_size: int = 1
```

Batch size for processing multiple pages

#### ``engine\_options`pydantic-field`

```
engine_options: BaseVlmEngineOptions
```

Runtime configuration (transformers, mlx, api, etc.)

#### ``force\_backend\_text`pydantic-field`

```
force_backend_text: bool = False
```

Force use of backend text extraction instead of VLM

#### ``max\_size`pydantic-field`

```
max_size: Optional[int] = None
```

Maximum image dimension (width or height)

#### ``model\_spec`pydantic-field`

```
model_spec: VlmModelSpec
```

Model specification with runtime-specific overrides

#### ``scale`pydantic-field`

```
scale: float = 2.0
```

Image scaling factor for preprocessing

#### ``from\_preset`classmethod`

```
from_preset(preset_id: str, engine_options: Optional[BaseVlmEngineOptions] = None, **overrides)
```

Create options from a registered preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier

- **`engine_options`**
(`Optional[BaseVlmEngineOptions]`, default:
`None`
)
–



Optional engine override

- **`**overrides`**
–



Additional option overrides


Returns:

- –



Instance of the stage options class


#### ``get\_preset`classmethod`

```
get_preset(preset_id: str) -> StageModelPreset
```

Get a specific preset.

Parameters:

- **`preset_id`**
(`str`)
–



The preset identifier


Returns:

- `StageModelPreset`
–



The requested preset


Raises:

- `KeyError`
–



If preset not found


#### ``get\_preset\_info`classmethod`

```
get_preset_info() -> List[Dict[str, str]]
```

Get summary info for all presets (useful for CLI).

Returns:

- `List[Dict[str, str]]`
–



List of dicts with preset\_id, name, description, model


#### ``list\_preset\_ids`classmethod`

```
list_preset_ids() -> List[str]
```

List all preset IDs for this stage.

Returns:

- `List[str]`
–



List of preset IDs


#### ``list\_presets`classmethod`

```
list_presets() -> List[StageModelPreset]
```

List all presets for this stage.

Returns:

- `List[StageModelPreset]`
–



List of presets


#### ``register\_preset`classmethod`

```
register_preset(preset: StageModelPreset) -> None
```

Register a preset for this stage options class.

Parameters:

- **`preset`**
(`StageModelPreset`)
–



The preset to register


Note

If preset ID already registered, it will be silently skipped.
This allows for idempotent registration at module import time.

#### ``resolve\_engine\_options`classmethod`

```
resolve_engine_options(value)
```

### ``VlmExtractionPipelineOptions`pydantic-model`

Bases: `PipelineOptions`

Options for extraction pipeline.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "InferenceFramework": {
      "enum": [\
        "mlx",\
        "transformers",\
        "vllm"\
      ],
      "title": "InferenceFramework",
      "type": "string"
    },
    "InlineVlmOptions": {
      "description": "Configuration for inline vision-language models running locally.",
      "properties": {
        "kind": {
          "const": "inline_model_options",
          "default": "inline_model_options",
          "title": "Kind",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for the vision-language model. Guides the model's output format and content focus.",
          "title": "Prompt",
          "type": "string"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values provide more detail but increase processing time and memory usage. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "max_size": {
          "anyOf": [\
            {\
              "type": "integer"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Maximum image dimension (width or height) in pixels. Images larger than this are resized while maintaining aspect ratio. If None, no size limit is enforced.",
          "title": "Max Size"
        },
        "temperature": {
          "default": 0.0,
          "description": "Sampling temperature for text generation. 0.0 uses greedy decoding (deterministic), higher values (e.g., 0.7-1.0) increase randomness. Recommended: 0.0 for consistent outputs.",
          "title": "Temperature",
          "type": "number"
        },
        "repo_id": {
          "description": "HuggingFace model repository ID for the vision-language model. Must be a model capable of processing images and generating text.",
          "examples": [\
            "Qwen/Qwen2-VL-2B-Instruct",\
            "ibm-granite/granite-vision-3.3-2b"\
          ],
          "title": "Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Git revision (branch, tag, or commit hash) of the model repository. Allows pinning to specific model versions for reproducibility.",
          "examples": [\
            "main",\
            "v1.0.0"\
          ],
          "title": "Revision",
          "type": "string"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Allow execution of custom code from the model repository. Required for some models with custom architectures. Enable only for trusted sources due to security implications.",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "load_in_8bit": {
          "default": true,
          "description": "Load model weights in 8-bit precision using bitsandbytes quantization. Reduces memory usage by ~50% with minimal accuracy loss. Requires bitsandbytes library and CUDA.",
          "title": "Load In 8Bit",
          "type": "boolean"
        },
        "llm_int8_threshold": {
          "default": 6.0,
          "description": "Threshold for LLM.int8() quantization outlier detection. Values with magnitude above this threshold are kept in float16 for accuracy. Lower values increase quantization but may reduce quality.",
          "title": "Llm Int8 Threshold",
          "type": "number"
        },
        "quantized": {
          "default": false,
          "description": "Indicates if the model is pre-quantized (e.g., GGUF, AWQ). When True, skips runtime quantization. Use for models already quantized during training or conversion.",
          "title": "Quantized",
          "type": "boolean"
        },
        "inference_framework": {
          "$ref": "#/$defs/InferenceFramework",
          "description": "Inference framework for running the VLM. Options: `transformers` (HuggingFace), `mlx` (Apple Silicon), `vllm` (high-throughput serving)."
        },
        "transformers_model_type": {
          "$ref": "#/$defs/TransformersModelType",
          "default": "automodel",
          "description": "HuggingFace Transformers model class to use. Options: `automodel` (auto-detect), `automodel-vision2seq` (vision-to-sequence), `automodel-causallm` (causal LM), `automodel-imagetexttotext` (image+text to text)."
        },
        "transformers_prompt_style": {
          "$ref": "#/$defs/TransformersPromptStyle",
          "default": "chat",
          "description": "Prompt formatting style for Transformers models. Options: `chat` (chat template), `raw` (raw text), `none` (no formatting). Use `chat` for instruction-tuned models."
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected output format from the VLM. Options: `doctags` (structured tags), `markdown`, `html`, `otsl` (table structure), `plaintext`. Guides model output parsing."
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "PyTorch data type for model weights. Options: `float32`, `float16`, `bfloat16`. Lower precision reduces memory and increases speed. If None, uses model default.",
          "title": "Torch Dtype"
        },
        "supported_devices": {
          "default": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ],
          "description": "List of hardware accelerators supported by this VLM configuration.",
          "items": {
            "$ref": "#/$defs/AcceleratorDevice"
          },
          "title": "Supported Devices",
          "type": "array"
        },
        "stop_strings": {
          "default": [],
          "description": "List of strings that trigger generation stopping when encountered. Used to prevent the model from generating beyond desired output boundaries.",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "custom_stopping_criteria": {
          "default": [],
          "description": "Custom stopping criteria objects for fine-grained control over generation termination. Allows implementing complex stopping logic beyond simple string matching.",
          "items": {
            "anyOf": []
          },
          "title": "Custom Stopping Criteria",
          "type": "array"
        },
        "extra_generation_config": {
          "additionalProperties": true,
          "default": {},
          "description": "Additional generation configuration parameters passed to the model. Overrides or extends default generation settings (e.g., top_p, top_k, repetition_penalty).",
          "title": "Extra Generation Config",
          "type": "object"
        },
        "extra_processor_kwargs": {
          "additionalProperties": true,
          "default": {},
          "description": "Additional keyword arguments passed to the image processor. Used for model-specific preprocessing options not covered by standard parameters.",
          "title": "Extra Processor Kwargs",
          "type": "object"
        },
        "use_kv_cache": {
          "default": true,
          "description": "Enable key-value caching for transformer attention. Significantly speeds up generation by caching attention computations. Disable only for debugging or memory-constrained scenarios.",
          "title": "Use Kv Cache",
          "type": "boolean"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of tokens to generate. Limits output length to prevent runaway generation. Adjust based on expected output size and memory constraints.",
          "title": "Max New Tokens",
          "type": "integer"
        },
        "track_generated_tokens": {
          "default": false,
          "description": "Track and store generated tokens during inference. Useful for debugging, analysis, or implementing custom post-processing. Increases memory usage.",
          "title": "Track Generated Tokens",
          "type": "boolean"
        },
        "track_input_prompt": {
          "default": false,
          "description": "Track and store the input prompt sent to the model. Useful for debugging, logging, or auditing. May contain sensitive information.",
          "title": "Track Input Prompt",
          "type": "boolean"
        }
      },
      "required": [\
        "prompt",\
        "repo_id",\
        "inference_framework",\
        "response_format"\
      ],
      "title": "InlineVlmOptions",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "TransformersModelType": {
      "enum": [\
        "automodel",\
        "automodel-vision2seq",\
        "automodel-causallm",\
        "automodel-imagetexttotext"\
      ],
      "title": "TransformersModelType",
      "type": "string"
    },
    "TransformersPromptStyle": {
      "enum": [\
        "chat",\
        "raw",\
        "none"\
      ],
      "title": "TransformersPromptStyle",
      "type": "string"
    }
  },
  "description": "Options for extraction pipeline.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "vlm_options": {
      "$ref": "#/$defs/InlineVlmOptions",
      "default": {
        "kind": "inline_model_options",
        "prompt": "",
        "scale": 2.0,
        "max_size": null,
        "temperature": 0.0,
        "repo_id": "numind/NuExtract-2.0-2B",
        "revision": "fe5b2f0b63b81150721435a3ca1129a75c59c74e",
        "trust_remote_code": false,
        "load_in_8bit": true,
        "llm_int8_threshold": 6.0,
        "quantized": false,
        "inference_framework": "transformers",
        "transformers_model_type": "automodel-imagetexttotext",
        "transformers_prompt_style": "chat",
        "response_format": "plaintext",
        "torch_dtype": "bfloat16",
        "supported_devices": [\
          "cpu",\
          "cuda",\
          "mps",\
          "xpu"\
        ],
        "stop_strings": [],
        "custom_stopping_criteria": [],
        "extra_generation_config": {},
        "extra_processor_kwargs": {},
        "use_kv_cache": true,
        "max_new_tokens": 4096,
        "track_generated_tokens": false,
        "track_input_prompt": false
      },
      "description": "Vision-Language Model (VLM) configuration for structured information extraction. Specifies which VLM to use and its parameters for extracting structured data from documents using vision models."
    }
  },
  "title": "VlmExtractionPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `vlm_options`
(`InlineVlmOptions`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``kind`class-attribute`

```
kind: str
```

#### ``vlm\_options`pydantic-field`

```
vlm_options: InlineVlmOptions
```

Vision-Language Model (VLM) configuration for structured information extraction. Specifies which VLM to use and its parameters for extracting structured data from documents using vision models.

### ``VlmPipelineOptions`pydantic-model`

Bases: `PaginatedPipelineOptions`

Pipeline configuration for vision-language model based document processing.

Show JSON schema:

```
{
  "$defs": {
    "AcceleratorDevice": {
      "description": "Devices to run model inference",
      "enum": [\
        "auto",\
        "cpu",\
        "cuda",\
        "mps",\
        "xpu"\
      ],
      "title": "AcceleratorDevice",
      "type": "string"
    },
    "AcceleratorOptions": {
      "additionalProperties": false,
      "description": "Hardware acceleration configuration for model inference.\n\nCan be configured via environment variables with DOCLING_ prefix.",
      "properties": {
        "num_threads": {
          "default": 4,
          "description": "Number of CPU threads to use for model inference. Higher values can improve throughput on multi-core systems but may increase memory usage. Can be set via DOCLING_NUM_THREADS or OMP_NUM_THREADS environment variables. Recommended: number of physical CPU cores.",
          "title": "Num Threads",
          "type": "integer"
        },
        "device": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "$ref": "#/$defs/AcceleratorDevice"\
            }\
          ],
          "default": "auto",
          "description": "Hardware device for model inference. Options: `auto` (automatic detection), `cpu` (CPU only), `cuda` (NVIDIA GPU), `cuda:N` (specific GPU), `mps` (Apple Silicon), `xpu` (Intel GPU). Auto mode selects the best available device. Can be set via DOCLING_DEVICE environment variable.",
          "title": "Device"
        },
        "cuda_use_flash_attention2": {
          "default": false,
          "description": "Enable Flash Attention 2 optimization for CUDA devices. Provides significant speedup and memory reduction for transformer models on compatible NVIDIA GPUs (Ampere or newer). Requires flash-attn package installation. Can be set via DOCLING_CUDA_USE_FLASH_ATTENTION2 environment variable.",
          "title": "Cuda Use Flash Attention2",
          "type": "boolean"
        }
      },
      "title": "AcceleratorOptions",
      "type": "object"
    },
    "ApiModelConfig": {
      "description": "API-specific model configuration.\n\nFor API engines, configuration is simpler - just params to send.",
      "properties": {
        "params": {
          "additionalProperties": true,
          "description": "API parameters (model name, max_tokens, etc.)",
          "title": "Params",
          "type": "object"
        }
      },
      "title": "ApiModelConfig",
      "type": "object"
    },
    "BaseVlmEngineOptions": {
      "description": "Base configuration for VLM inference engines.\n\nEngine options are independent of model specifications and prompts.\nThey only control how the inference is executed.",
      "properties": {
        "engine_type": {
          "$ref": "#/$defs/VlmEngineType",
          "description": "Type of inference engine to use"
        }
      },
      "required": [\
        "engine_type"\
      ],
      "title": "BaseVlmEngineOptions",
      "type": "object"
    },
    "EngineModelConfig": {
      "description": "Engine-specific model configuration.\n\nAllows overriding model settings for specific engines.\nFor example, MLX might use a different repo_id than Transformers.",
      "properties": {
        "repo_id": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model repository ID for this engine",
          "title": "Repo Id"
        },
        "revision": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override model revision for this engine",
          "title": "Revision"
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Override torch dtype for this engine (e.g., 'bfloat16')",
          "title": "Torch Dtype"
        },
        "extra_config": {
          "additionalProperties": true,
          "description": "Additional engine-specific configuration",
          "title": "Extra Config",
          "type": "object"
        }
      },
      "title": "EngineModelConfig",
      "type": "object"
    },
    "InferenceFramework": {
      "enum": [\
        "mlx",\
        "transformers",\
        "vllm"\
      ],
      "title": "InferenceFramework",
      "type": "string"
    },
    "InlineVlmOptions": {
      "description": "Configuration for inline vision-language models running locally.",
      "properties": {
        "kind": {
          "const": "inline_model_options",
          "default": "inline_model_options",
          "title": "Kind",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for the vision-language model. Guides the model's output format and content focus.",
          "title": "Prompt",
          "type": "string"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values provide more detail but increase processing time and memory usage. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "max_size": {
          "anyOf": [\
            {\
              "type": "integer"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Maximum image dimension (width or height) in pixels. Images larger than this are resized while maintaining aspect ratio. If None, no size limit is enforced.",
          "title": "Max Size"
        },
        "temperature": {
          "default": 0.0,
          "description": "Sampling temperature for text generation. 0.0 uses greedy decoding (deterministic), higher values (e.g., 0.7-1.0) increase randomness. Recommended: 0.0 for consistent outputs.",
          "title": "Temperature",
          "type": "number"
        },
        "repo_id": {
          "description": "HuggingFace model repository ID for the vision-language model. Must be a model capable of processing images and generating text.",
          "examples": [\
            "Qwen/Qwen2-VL-2B-Instruct",\
            "ibm-granite/granite-vision-3.3-2b"\
          ],
          "title": "Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Git revision (branch, tag, or commit hash) of the model repository. Allows pinning to specific model versions for reproducibility.",
          "examples": [\
            "main",\
            "v1.0.0"\
          ],
          "title": "Revision",
          "type": "string"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Allow execution of custom code from the model repository. Required for some models with custom architectures. Enable only for trusted sources due to security implications.",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "load_in_8bit": {
          "default": true,
          "description": "Load model weights in 8-bit precision using bitsandbytes quantization. Reduces memory usage by ~50% with minimal accuracy loss. Requires bitsandbytes library and CUDA.",
          "title": "Load In 8Bit",
          "type": "boolean"
        },
        "llm_int8_threshold": {
          "default": 6.0,
          "description": "Threshold for LLM.int8() quantization outlier detection. Values with magnitude above this threshold are kept in float16 for accuracy. Lower values increase quantization but may reduce quality.",
          "title": "Llm Int8 Threshold",
          "type": "number"
        },
        "quantized": {
          "default": false,
          "description": "Indicates if the model is pre-quantized (e.g., GGUF, AWQ). When True, skips runtime quantization. Use for models already quantized during training or conversion.",
          "title": "Quantized",
          "type": "boolean"
        },
        "inference_framework": {
          "$ref": "#/$defs/InferenceFramework",
          "description": "Inference framework for running the VLM. Options: `transformers` (HuggingFace), `mlx` (Apple Silicon), `vllm` (high-throughput serving)."
        },
        "transformers_model_type": {
          "$ref": "#/$defs/TransformersModelType",
          "default": "automodel",
          "description": "HuggingFace Transformers model class to use. Options: `automodel` (auto-detect), `automodel-vision2seq` (vision-to-sequence), `automodel-causallm` (causal LM), `automodel-imagetexttotext` (image+text to text)."
        },
        "transformers_prompt_style": {
          "$ref": "#/$defs/TransformersPromptStyle",
          "default": "chat",
          "description": "Prompt formatting style for Transformers models. Options: `chat` (chat template), `raw` (raw text), `none` (no formatting). Use `chat` for instruction-tuned models."
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected output format from the VLM. Options: `doctags` (structured tags), `markdown`, `html`, `otsl` (table structure), `plaintext`. Guides model output parsing."
        },
        "torch_dtype": {
          "anyOf": [\
            {\
              "type": "string"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "PyTorch data type for model weights. Options: `float32`, `float16`, `bfloat16`. Lower precision reduces memory and increases speed. If None, uses model default.",
          "title": "Torch Dtype"
        },
        "supported_devices": {
          "default": [\
            "cpu",\
            "cuda",\
            "mps",\
            "xpu"\
          ],
          "description": "List of hardware accelerators supported by this VLM configuration.",
          "items": {
            "$ref": "#/$defs/AcceleratorDevice"
          },
          "title": "Supported Devices",
          "type": "array"
        },
        "stop_strings": {
          "default": [],
          "description": "List of strings that trigger generation stopping when encountered. Used to prevent the model from generating beyond desired output boundaries.",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "custom_stopping_criteria": {
          "default": [],
          "description": "Custom stopping criteria objects for fine-grained control over generation termination. Allows implementing complex stopping logic beyond simple string matching.",
          "items": {
            "anyOf": []
          },
          "title": "Custom Stopping Criteria",
          "type": "array"
        },
        "extra_generation_config": {
          "additionalProperties": true,
          "default": {},
          "description": "Additional generation configuration parameters passed to the model. Overrides or extends default generation settings (e.g., top_p, top_k, repetition_penalty).",
          "title": "Extra Generation Config",
          "type": "object"
        },
        "extra_processor_kwargs": {
          "additionalProperties": true,
          "default": {},
          "description": "Additional keyword arguments passed to the image processor. Used for model-specific preprocessing options not covered by standard parameters.",
          "title": "Extra Processor Kwargs",
          "type": "object"
        },
        "use_kv_cache": {
          "default": true,
          "description": "Enable key-value caching for transformer attention. Significantly speeds up generation by caching attention computations. Disable only for debugging or memory-constrained scenarios.",
          "title": "Use Kv Cache",
          "type": "boolean"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of tokens to generate. Limits output length to prevent runaway generation. Adjust based on expected output size and memory constraints.",
          "title": "Max New Tokens",
          "type": "integer"
        },
        "track_generated_tokens": {
          "default": false,
          "description": "Track and store generated tokens during inference. Useful for debugging, analysis, or implementing custom post-processing. Increases memory usage.",
          "title": "Track Generated Tokens",
          "type": "boolean"
        },
        "track_input_prompt": {
          "default": false,
          "description": "Track and store the input prompt sent to the model. Useful for debugging, logging, or auditing. May contain sensitive information.",
          "title": "Track Input Prompt",
          "type": "boolean"
        }
      },
      "required": [\
        "prompt",\
        "repo_id",\
        "inference_framework",\
        "response_format"\
      ],
      "title": "InlineVlmOptions",
      "type": "object"
    },
    "PictureClassificationLabel": {
      "description": "PictureClassificationLabel.",
      "enum": [\
        "other",\
        "picture_group",\
        "pie_chart",\
        "bar_chart",\
        "stacked_bar_chart",\
        "line_chart",\
        "flow_chart",\
        "scatter_chart",\
        "heatmap",\
        "remote_sensing",\
        "natural_image",\
        "chemistry_molecular_structure",\
        "chemistry_markush_structure",\
        "icon",\
        "logo",\
        "signature",\
        "stamp",\
        "qr_code",\
        "bar_code",\
        "screenshot",\
        "map",\
        "stratigraphic_chart",\
        "cad_drawing",\
        "electrical_diagram"\
      ],
      "title": "PictureClassificationLabel",
      "type": "string"
    },
    "PictureDescriptionBaseOptions": {
      "description": "Base configuration for picture description models.",
      "properties": {
        "batch_size": {
          "default": 8,
          "description": "Number of images to process in a single batch during picture description. Higher values improve throughput but increase memory usage. Adjust based on available GPU/CPU memory.",
          "title": "Batch Size",
          "type": "integer"
        },
        "scale": {
          "default": 2.0,
          "description": "Scaling factor for image resolution before processing. Higher values (e.g., 2.0) provide more detail for the vision model but increase processing time and memory. Range: 0.5-4.0 typical.",
          "title": "Scale",
          "type": "number"
        },
        "picture_area_threshold": {
          "default": 0.05,
          "description": "Minimum picture area as fraction of page area (0.0-1.0) to trigger description. Pictures smaller than this threshold are skipped. Use lower values (e.g., 0.01) to describe small images.",
          "title": "Picture Area Threshold",
          "type": "number"
        },
        "classification_allow": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to allow for description. Only pictures classified with these labels will be processed. If None, all picture types are allowed unless explicitly denied. Use to focus description on specific image types (e.g., diagrams, charts).",
          "title": "Classification Allow"
        },
        "classification_deny": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/PictureClassificationLabel"\
              },\
              "type": "array"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "List of picture classification labels to exclude from description. Pictures classified with these labels will be skipped. If None, no picture types are denied unless not in allow list. Use to exclude unwanted image types (e.g., decorative images, logos).",
          "title": "Classification Deny"
        },
        "classification_min_confidence": {
          "default": 0.0,
          "description": "Minimum classification confidence score (0.0-1.0) required for a picture to be processed. Pictures with classification confidence below this threshold are skipped. Higher values ensure only confidently classified images are described. Range: 0.0 (no filtering) to 1.0 (maximum confidence).",
          "title": "Classification Min Confidence",
          "type": "number"
        }
      },
      "title": "PictureDescriptionBaseOptions",
      "type": "object"
    },
    "ResponseFormat": {
      "enum": [\
        "doctags",\
        "markdown",\
        "deepseekocr_markdown",\
        "html",\
        "otsl",\
        "plaintext"\
      ],
      "title": "ResponseFormat",
      "type": "string"
    },
    "TransformersModelType": {
      "enum": [\
        "automodel",\
        "automodel-vision2seq",\
        "automodel-causallm",\
        "automodel-imagetexttotext"\
      ],
      "title": "TransformersModelType",
      "type": "string"
    },
    "TransformersPromptStyle": {
      "enum": [\
        "chat",\
        "raw",\
        "none"\
      ],
      "title": "TransformersPromptStyle",
      "type": "string"
    },
    "VlmConvertOptions": {
      "description": "Configuration for VLM-based document conversion.\n\nThis stage uses vision-language models to convert document pages to\nstructured formats (DocTags, Markdown, etc.). Supports preset-based\nconfiguration via StagePresetMixin.\n\nExamples:\n    # Use preset with default runtime\n    options = VlmConvertOptions.from_preset(\"smoldocling\")\n\n    # Use preset with runtime override\n    from docling.datamodel.vlm_engine_options import ApiVlmEngineOptions, VlmEngineType\n    options = VlmConvertOptions.from_preset(\n        \"smoldocling\",\n        engine_options=ApiVlmEngineOptions(engine_type=VlmEngineType.API_OLLAMA)\n    )",
      "properties": {
        "engine_options": {
          "$ref": "#/$defs/BaseVlmEngineOptions",
          "description": "Runtime configuration (transformers, mlx, api, etc.)"
        },
        "model_spec": {
          "$ref": "#/$defs/VlmModelSpec",
          "description": "Model specification with runtime-specific overrides"
        },
        "scale": {
          "default": 2.0,
          "description": "Image scaling factor for preprocessing",
          "title": "Scale",
          "type": "number"
        },
        "max_size": {
          "anyOf": [\
            {\
              "type": "integer"\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Maximum image dimension (width or height)",
          "title": "Max Size"
        },
        "batch_size": {
          "default": 1,
          "description": "Batch size for processing multiple pages",
          "title": "Batch Size",
          "type": "integer"
        },
        "force_backend_text": {
          "default": false,
          "description": "Force use of backend text extraction instead of VLM",
          "title": "Force Backend Text",
          "type": "boolean"
        }
      },
      "required": [\
        "engine_options",\
        "model_spec"\
      ],
      "title": "VlmConvertOptions",
      "type": "object"
    },
    "VlmEngineType": {
      "description": "Types of VLM inference engines available.",
      "enum": [\
        "transformers",\
        "mlx",\
        "vllm",\
        "api",\
        "api_ollama",\
        "api_lmstudio",\
        "api_openai",\
        "auto_inline"\
      ],
      "title": "VlmEngineType",
      "type": "string"
    },
    "VlmModelSpec": {
      "description": "Specification for a VLM model.\n\nThis defines the model configuration that is independent of the engine.\nIt includes:\n- Default model repository ID\n- Prompt template\n- Response format\n- Engine-specific overrides",
      "properties": {
        "name": {
          "description": "Human-readable model name",
          "title": "Name",
          "type": "string"
        },
        "default_repo_id": {
          "description": "Default HuggingFace repository ID",
          "title": "Default Repo Id",
          "type": "string"
        },
        "revision": {
          "default": "main",
          "description": "Default model revision",
          "title": "Revision",
          "type": "string"
        },
        "prompt": {
          "description": "Prompt template for this model",
          "title": "Prompt",
          "type": "string"
        },
        "response_format": {
          "$ref": "#/$defs/ResponseFormat",
          "description": "Expected response format from the model"
        },
        "supported_engines": {
          "anyOf": [\
            {\
              "items": {\
                "$ref": "#/$defs/VlmEngineType"\
              },\
              "type": "array",\
              "uniqueItems": true\
            },\
            {\
              "type": "null"\
            }\
          ],
          "default": null,
          "description": "Set of supported engines (None = all supported)",
          "title": "Supported Engines"
        },
        "engine_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/EngineModelConfig"
          },
          "description": "Engine-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Engine Overrides",
          "type": "object"
        },
        "api_overrides": {
          "additionalProperties": {
            "$ref": "#/$defs/ApiModelConfig"
          },
          "description": "API-specific configuration overrides",
          "propertyNames": {
            "$ref": "#/$defs/VlmEngineType"
          },
          "title": "Api Overrides",
          "type": "object"
        },
        "trust_remote_code": {
          "default": false,
          "description": "Whether to trust remote code for this model",
          "title": "Trust Remote Code",
          "type": "boolean"
        },
        "stop_strings": {
          "description": "Stop strings for generation",
          "items": {
            "type": "string"
          },
          "title": "Stop Strings",
          "type": "array"
        },
        "max_new_tokens": {
          "default": 4096,
          "description": "Maximum number of new tokens to generate",
          "title": "Max New Tokens",
          "type": "integer"
        }
      },
      "required": [\
        "name",\
        "default_repo_id",\
        "prompt",\
        "response_format"\
      ],
      "title": "VlmModelSpec",
      "type": "object"
    }
  },
  "description": "Pipeline configuration for vision-language model based document processing.",
  "properties": {
    "document_timeout": {
      "anyOf": [\
        {\
          "type": "number"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.",
      "examples": [\
        10.0,\
        20.0\
      ],
      "title": "Document Timeout"
    },
    "accelerator_options": {
      "$ref": "#/$defs/AcceleratorOptions",
      "default": {
        "num_threads": 4,
        "device": "auto",
        "cuda_use_flash_attention2": false
      },
      "description": "Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models."
    },
    "enable_remote_services": {
      "default": false,
      "description": "Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.",
      "examples": [\
        false\
      ],
      "title": "Enable Remote Services",
      "type": "boolean"
    },
    "allow_external_plugins": {
      "default": false,
      "description": "Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.",
      "examples": [\
        false\
      ],
      "title": "Allow External Plugins",
      "type": "boolean"
    },
    "artifacts_path": {
      "anyOf": [\
        {\
          "format": "path",\
          "type": "string"\
        },\
        {\
          "type": "string"\
        },\
        {\
          "type": "null"\
        }\
      ],
      "default": null,
      "description": "Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.",
      "examples": [\
        "./artifacts",\
        "/tmp/docling_outputs"\
      ],
      "title": "Artifacts Path"
    },
    "do_picture_classification": {
      "default": false,
      "description": "Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.",
      "title": "Do Picture Classification",
      "type": "boolean"
    },
    "do_picture_description": {
      "default": false,
      "description": "Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.",
      "title": "Do Picture Description",
      "type": "boolean"
    },
    "picture_description_options": {
      "$ref": "#/$defs/PictureDescriptionBaseOptions",
      "default": {
        "batch_size": 8,
        "scale": 2.0,
        "picture_area_threshold": 0.05,
        "classification_allow": null,
        "classification_deny": null,
        "classification_min_confidence": 0.0,
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_lmstudio": {
              "params": {
                "model": "smolvlm-256m-instruct"
              }
            }
          },
          "default_repo_id": "HuggingFaceTB/SmolVLM-256M-Instruct",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "moot20/SmolVLM-256M-Instruct-MLX",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": "bfloat16"
            }
          },
          "max_new_tokens": 4096,
          "name": "SmolVLM-256M-Instruct",
          "prompt": "Describe this image in a few sentences.",
          "response_format": "plaintext",
          "revision": "main",
          "stop_strings": [],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "prompt": "Describe this image in a few sentences.",
        "generation_config": {
          "do_sample": false,
          "max_new_tokens": 200
        }
      },
      "description": "Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from_preset('granite_vision')"
    },
    "do_chart_extraction": {
      "default": false,
      "title": "Do Chart Extraction",
      "type": "boolean"
    },
    "images_scale": {
      "default": 1.0,
      "description": "Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).",
      "title": "Images Scale",
      "type": "number"
    },
    "generate_page_images": {
      "default": true,
      "description": "Generate page images for VLM processing. Required for vision-language models to analyze document pages. Automatically enabled in VLM pipeline.",
      "title": "Generate Page Images",
      "type": "boolean"
    },
    "generate_picture_images": {
      "default": false,
      "description": "Extract and save embedded images from the document. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.",
      "title": "Generate Picture Images",
      "type": "boolean"
    },
    "force_backend_text": {
      "default": false,
      "description": "Force use of backend's native text extraction instead of VLM predictions. When enabled, bypasses VLM text detection and uses embedded text from the document directly.",
      "title": "Force Backend Text",
      "type": "boolean"
    },
    "vlm_options": {
      "anyOf": [\
        {\
          "$ref": "#/$defs/VlmConvertOptions"\
        },\
        {\
          "$ref": "#/$defs/InlineVlmOptions"\
        }\
      ],
      "default": {
        "engine_options": {
          "engine_type": "auto_inline"
        },
        "model_spec": {
          "api_overrides": {
            "api_ollama": {
              "params": {
                "model": "ibm/granite-docling:258m"
              }
            }
          },
          "default_repo_id": "ibm-granite/granite-docling-258M",
          "engine_overrides": {
            "mlx": {
              "extra_config": {},
              "repo_id": "ibm-granite/granite-docling-258M-mlx",
              "revision": null,
              "torch_dtype": null
            },
            "transformers": {
              "extra_config": {
                "extra_generation_config": {
                  "skip_special_tokens": false
                },
                "transformers_model_type": "automodel-imagetexttotext"
              },
              "repo_id": null,
              "revision": null,
              "torch_dtype": null
            }
          },
          "max_new_tokens": 8192,
          "name": "Granite-Docling-258M",
          "prompt": "Convert this page to docling.",
          "response_format": "doctags",
          "revision": "main",
          "stop_strings": [\
            "</doctag>",\
            "<|end_of_text|>"\
          ],
          "supported_engines": null,
          "trust_remote_code": false
        },
        "scale": 2.0,
        "max_size": null,
        "batch_size": 1,
        "force_backend_text": false
      },
      "description": "Vision-Language Model configuration for document understanding. Uses new VlmConvertOptions with preset system (recommended). Legacy InlineVlmOptions/ApiVlmOptions still supported. Default: 'granite_docling' preset. Example: VlmConvertOptions.from_preset('smoldocling')",
      "title": "Vlm Options"
    }
  },
  "title": "VlmPipelineOptions",
  "type": "object"
}
```

Fields:

- `document_timeout`
(`Optional[float]`)

- `accelerator_options`
(`AcceleratorOptions`)

- `enable_remote_services`
(`bool`)

- `allow_external_plugins`
(`bool`)

- `artifacts_path`
(`Optional[Union[Path, str]]`)

- `do_picture_classification`
(`bool`)

- `do_picture_description`
(`bool`)

- `picture_description_options`
(`PictureDescriptionBaseOptions`)

- `do_chart_extraction`
(`bool`)

- `images_scale`
(`float`)

- `generate_picture_images`
(`bool`)

- `generate_page_images`
(`bool`)

- `force_backend_text`
(`bool`)

- `vlm_options`
(`Union[VlmConvertOptions, InlineVlmOptions, ApiVlmOptions]`)


#### ``accelerator\_options`pydantic-field`

```
accelerator_options: AcceleratorOptions
```

Hardware acceleration configuration for model inference. Controls GPU device selection, memory management, and execution optimization settings for layout, OCR, and table structure models.

#### ``allow\_external\_plugins`pydantic-field`

```
allow_external_plugins: bool
```

Allow loading external third-party plugins for OCR, layout, table structure, or picture description models. Enables custom model implementations via plugin system. Disabled by default for security.

#### ``artifacts\_path`pydantic-field`

```
artifacts_path: Optional[Union[Path, str]]
```

Local directory containing pre-downloaded model artifacts (weights, configs). If None, models are fetched from remote sources on first use. Use `docling-tools models download` to pre-fetch artifacts for offline operation or faster initialization.

#### ``do\_chart\_extraction`pydantic-field`

```
do_chart_extraction: bool = False
```

#### ``do\_picture\_classification`pydantic-field`

```
do_picture_classification: bool
```

Enable picture classification to categorize images by type (photo, diagram, chart, etc.). Useful for downstream processing that requires image type awareness.

#### ``do\_picture\_description`pydantic-field`

```
do_picture_description: bool
```

Enable automatic generation of textual descriptions for pictures using vision-language models. Descriptions are added to the document for accessibility and searchability.

#### ``document\_timeout`pydantic-field`

```
document_timeout: Optional[float]
```

Maximum processing time in seconds before aborting document conversion. When exceeded, the pipeline stops processing and returns partial results with PARTIAL\_SUCCESS status. If None, no timeout is enforced. Recommended: 90-120 seconds for production systems.

#### ``enable\_remote\_services`pydantic-field`

```
enable_remote_services: bool
```

Allow pipeline to call external APIs or cloud services during processing. Required for API-based picture description models. Disabled by default for security and offline operation.

#### ``force\_backend\_text`pydantic-field`

```
force_backend_text: bool
```

Force use of backend's native text extraction instead of VLM predictions. When enabled, bypasses VLM text detection and uses embedded text from the document directly.

#### ``generate\_page\_images`pydantic-field`

```
generate_page_images: bool
```

Generate page images for VLM processing. Required for vision-language models to analyze document pages. Automatically enabled in VLM pipeline.

#### ``generate\_picture\_images`pydantic-field`

```
generate_picture_images: bool
```

Extract and save embedded images from the document. Exports individual images (figures, photos, diagrams, charts) found in the document as separate image files for downstream use.

#### ``images\_scale`pydantic-field`

```
images_scale: float
```

Scaling factor for generated images. Higher values produce higher resolution but increase processing time and storage requirements. Recommended values: 1.0 (standard quality), 2.0 (high resolution), 0.5 (lower resolution for previews).

#### ``kind`class-attribute`

```
kind: str
```

#### ``picture\_description\_options`pydantic-field`

```
picture_description_options: PictureDescriptionBaseOptions
```

Configuration for picture description model. Uses new preset system (recommended). Default: 'smolvlm' preset. Only applicable when `do_picture_description=True`. Example: PictureDescriptionVlmOptions.from\_preset('granite\_vision')

#### ``vlm\_options`pydantic-field`

```
vlm_options: Union[VlmConvertOptions, InlineVlmOptions, ApiVlmOptions]
```

Vision-Language Model configuration for document understanding. Uses new VlmConvertOptions with preset system (recommended). Legacy InlineVlmOptions/ApiVlmOptions still supported. Default: 'granite\_docling' preset. Example: VlmConvertOptions.from\_preset('smoldocling')

### ``normalize\_pdf\_backend

```
normalize_pdf_backend(backend: PdfBackend) -> PdfBackend
```

Normalize deprecated backend enum values to current ones.

Parameters:

- **`backend`**
(`PdfBackend`)
–



The PDF backend enum value to normalize.


Returns:

- `PdfBackend`
–



The normalized backend enum value.


Raises:

- `DeprecationWarning`
–



If a deprecated backend value is used.


Back to top