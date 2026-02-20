[Sitemap](https://chaimrand.medium.com/sitemap/sitemap.xml)

[Open in app](https://play.google.com/store/apps/details?id=com.medium.reader&referrer=utm_source%3DmobileNavBar&source=post_page---top_nav_layout_nav-----------------------------------------)

Sign up

[Sign in](https://medium.com/m/signin?operation=login&redirect=https%3A%2F%2Fchaimrand.medium.com%2Foptimizing-pytorch-model-inference-on-cpu-ccd3aa5884ad&source=post_page---top_nav_layout_nav-----------------------global_nav------------------)

[Medium Logo](https://medium.com/?source=post_page---top_nav_layout_nav-----------------------------------------)

[Write](https://medium.com/m/signin?operation=register&redirect=https%3A%2F%2Fmedium.com%2Fnew-story&source=---top_nav_layout_nav-----------------------new_post_topnav------------------)

[Search](https://medium.com/search?source=post_page---top_nav_layout_nav-----------------------------------------)

Sign up

[Sign in](https://medium.com/m/signin?operation=login&redirect=https%3A%2F%2Fchaimrand.medium.com%2Foptimizing-pytorch-model-inference-on-cpu-ccd3aa5884ad&source=post_page---top_nav_layout_nav-----------------------global_nav------------------)

![](https://miro.medium.com/v2/resize:fill:32:32/1*dmbNkD5D-u45r44go_cf0g.png)

# Optimizing PyTorch Model Inference on CPU

## Flyin’ Like a Lion on Intel Xeon

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:32:32/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---byline--ccd3aa5884ad---------------------------------------)

[Chaim Rand](https://chaimrand.medium.com/?source=post_page---byline--ccd3aa5884ad---------------------------------------)

Follow

16 min read

·

Oct 19, 2025

61

3

[Listen](https://medium.com/m/signin?actionUrl=https%3A%2F%2Fmedium.com%2Fplans%3Fdimension%3Dpost_audio_button%26postId%3Dccd3aa5884ad&operation=register&redirect=https%3A%2F%2Fchaimrand.medium.com%2Foptimizing-pytorch-model-inference-on-cpu-ccd3aa5884ad&source=---header_actions--ccd3aa5884ad---------------------post_audio_button------------------)

Share

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:700/0*-WyxU2epbVcmNLDD)

Photo by [Ingo Stiller](https://unsplash.com/@ingo231177?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

As reliance on AI models grows, so does the criticality of optimizing their runtime performance. While the degree to which AI models will outperform human intelligence remains a heated topic of debate, their need for powerful and expensive compute resources is unquestionable — and even notorious.

In [previous posts](https://towardsdatascience.com/author/chaimrand/), we covered the topic of AI model optimization — primarily in the context of model training — and demonstrated how it can have a decisive impact on the cost and speed of AI model development. In this post, we focus our attention on AI model inference, where model optimization has an additional objective: To minimize the latency of inference requests and improve the user experience of the model consumer.

In this post, we will assume that the platform on which model inference is performed is a 4th Gen Intel® Xeon® Scalable CPU processor, more specifically, an Amazon EC2 [c7i.xlarge](https://aws.amazon.com/ec2/instance-types/c7i/) instance (with 4 Intel Xeon vCPUs) running a dedicated [Deep Learning Ubuntu (22.04) AMI](https://docs.aws.amazon.com/dlami/latest/devguide/aws-deep-learning-x86-gpu-pytorch-2.7-ubuntu-22-04.html) and a CPU build of [PyTorch 2.8.0](https://pytorch.org/get-started/locally/). Of course, the choice of a model deployment platform is one of the many important decisions taken when designing an AI solution along with the choice of model architecture, development framework, training accelerator, data format, deployment strategy, etc. — each one of which must be taken with consideration of the associated costs and runtime speed. The choice of a CPU processor for running model inference may seem surprising in an era in which the number of dedicated AI inference accelerators is continuously growing. However, as we will see, there are some occasions when the best (and cheapest) option may very well be just a good old-fashioned CPU.

We will introduce a toy image-classification model and proceed to demonstrate some of the optimization opportunities for AI model inference on an Intel® Xeon® CPU. The deployment of an AI model typically includes a full inference server solution, but for the sake of simplicity, we will limit our discussion to just the model’s core execution. For a primer on model inference serving, please see our previous post: [The Case for Centralized AI Model Inference Serving](https://towardsdatascience.com/the-case-for-centralized-ai-model-inference-serving/).

Our intention in this post is to demonstrate that: 1) a few simple optimization techniques can result in meaningful performance gains and 2) that reaching such results does not require specialized expertise in performance analyzers (such as [Intel® VTune™ Profiler](https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html)) or on the inner workings of the low-level compute kernels. Importantly, the process of AI model optimization can differ considerably based on the model architecture and runtime environment. Optimizing for training will differ from optimizing for inference. Optimizing a transformer model will differ from optimizing a CNN model. Optimizing a 22-billion-parameter model will differ from optimizing a 100-million parameter model. Optimizing a model to run on a GPU will differ from optimizing it for a CPU. Even different generations of the same CPU family may have different computation components and, consequently, different optimization techniques. While the high-level steps for optimizing a given model on a given instance are pretty standard, the specific course it will take and the end result can vary greatly based on the project at hand.

The code snippets we will share are intended for demonstrative purposes. Please do not rely on their accuracy or their optimality. Please do not interpret our mention of any tool or technique as an endorsement for its use. Ultimately, the best design choices for your use case will greatly depend on the details of your project and, given the extent of the potential impact on performance, should be evaluated with the appropriate time and attention.

## Why CPU?

With the ever-increasing number of hardware solutions for executing AI/ML model inference, our choice of a CPU may seem surprising. In this section, we describe some scenarios in which CPU may be the preferred platform for inference.

1. **Accessibility**: The use of dedicated AI accelerators — such as GPUs — typically requires dedicated deployment and maintenance or, alternatively, access to such instances on a cloud service platform. CPUs, on the other hand, are everywhere. Designing a solution to run on a CPU provides much greater flexibility and increases the opportunities for deployment.
2. **Availability**: Even if your algorithm can access an AI accelerator, there is the question of availability. AI accelerators are in extremely high demand, and even if/when you are able to acquire one, whether it be on-prem or in the cloud, you may choose to prioritize them for tasks that are even more resource intensive, such as AI model training.
3. **Reduced Latency**: There are many situations in which your AI model is just one component in a pipeline of software algorithms running on a standard CPU. While the AI model may perform significantly faster on an AI accelerator, when taking into account the time required to send an inference request over the network, it is quite possible that running it on the same CPU will be faster.
4. **Underuse of Accelerator**: AI accelerators are typically quite expensive. To justify their cost, your goal should be to keep them fully occupied, minimizing their idle time. In some cases, the inference load will not justify the cost of an expensive AI accelerator.
5. **Model Architecture**: These days, we tend to automatically assume that AI models will perform significantly better on AI accelerators than on CPUs. And while more often than not, this is indeed the case, your model may include layers that perform better on CPU. For example, sequential algorithms such as Non-Maximum Suppression (NMS) and the Hungarian matching algorithm tend to perform better on CPU than GPU and are often offloaded onto the CPU even if a GPU is available (e.g., see [here](https://github.com/pytorch/vision/blob/v0.19.1/torchvision/csrc/ops/cuda/nms_kernel.cu)). If your model contains many such layers, running it on a CPU might not be such a bad option.

### Why Intel Xeon?

[Intel® Xeon® Scalable CPU](https://www.intel.com/content/www/us/en/products/details/processors/xeon/scalable.html) processors come with built-in accelerators for the matrix and convolution operators that are common in typical AI/ML workloads. These include [AVX-512](https://www.intel.com/content/www/us/en/architecture-and-technology/avx-512-overview.html) (introduced in Gen1), the [VNNI extension](https://www.intel.com/content/www/us/en/developer/articles/guide/deep-learning-with-avx512-and-dl-boost.html) (Gen2), and [AMX](https://www.intel.com/content/www/us/en/products/docs/accelerator-engines/what-is-intel-amx.html) (Gen4). The AMX engine, in particular, includes specialized hardware instructions for executing AI models using bfloat16 and int8 precision data types. The acceleration engines are tightly integrated with Intel’s optimized software stack, which includes [oneDNN](https://www.intel.com/content/www/us/en/developer/tools/oneapi/onednn.html), [OpenVINO](https://www.intel.com/content/www/us/en/developer/tools/openvino-toolkit/overview.html), and the [Intel Extension for PyTorch](https://www.intel.com/content/www/us/en/developer/articles/technical/accelerate-with-intel-extension-for-pytorch.html) (IPEX). These libraries utilize the dedicated Intel® Xeon® hardware capabilities to optimize model execution with minimal code changes.

Despite the arguments made in this section, the choice of inference vehicle should be made after considering all options available and after assessing the opportunities for optimization on each one. In the next sections, we will introduce a toy experiment and explore some of the optimization opportunities on CPU.

## Inference Experiment

In this section, we define a toy AI model inference experiment comprising a [Resnet50](https://docs.pytorch.org/vision/main/models/generated/torchvision.models.resnet50.html) image classification model, a randomly generated input batch, and a simple benchmarking utility which we use to report the average number of input samples processed per second (SPS).

```
import torch, torchvision
import time

def get_model():
    model = torchvision.models.resnet50()
    model = model.eval()
    return model

def get_input(batch_size):
    batch = torch.randn(batch_size, 3, 224, 224)
    return batch

def get_inference_fn(model):
    def infer_fn(batch):
        with torch.inference_mode():
            output = model(batch)
        return output
    return infer_fn

def benchmark(infer_fn, batch):
    # warm-up
    for _ in range(10):
        _ = infer_fn(batch)

    iters = 100

    start = time.time()
    for _ in range(iters):
        _ = infer_fn(batch)
    end = time.time()

    return (end - start) / iters

batch_size = 1
model = get_model()
batch = get_input(batch_size)
infer_fn = get_inference_fn(model)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

The baseline performance of our toy model is 22.76 samples per second (SPS).

## Model Inference Optimization

In this section, we apply a number of optimizations to our toy experiment and assess their impact on runtime performance. Our focus will be on optimization techniques that can be applied with relative ease. While it is quite likely that additional performance gains can be achieved, these may require much greater specialization and a more significant time investment.

Our focus will be on optimizations that do not change the model architecture; optimization techniques such as model distillation and model pruning are out of the context of this post. Also out of scope are methods for optimizing specific model components, e.g., by implementing custom PyTorch operators.

In a previous post we discussed AI model optimization on Intel XEON CPUs in the context of training workloads. In this section we will revisit some of the techniques mentioned there, this time in the context of AI model inference. We will complement these with optimization techniques that are unique to inference settings, including model compilation for inference, INT8 quantization, and multi-worker inference.

The order in which we present the optimization methods is not binding. In fact, some of the techniques are interdependent; for example, increasing the number of inference workers could impact the optimal choice of batch size.

### Optimization 1: Batched Inference

A common method for increasing resource utilization while reducing the average inference response time is to group input samples into batches. In real-world scenarios, we need to make sure to cap the batch size so that we meet the service level response time requirements, but for the purposes of our experiment we ignore this requirement. Experimenting with different batch sizes we find that a batch size of 8 results in a throughput of 26.28 SPS, 15% higher than the baseline result.

Note that in the case that the shapes of the input samples vary, batching requires more handling (e.g., see [here](https://towardsdatascience.com/optimizing-transformer-models-for-variable-length-input-sequences-19fb88fddf71/)).

### Optimization 2: Channels-Last Memory Format

By default in PyTorch, 4D tensors are stored in NCHW format, i.e., the four dimensions represent the batch size, channels, height, and width, respectively. However, the channels-last or NHWC format (i.e., batch size, height, width, and channels) exhibits better performance on CPU. Adjusting our inference script to apply the channels-last optimization is a simple matter of setting the memory format of both the model and the input to _torch.channels\_last_ as shown below:

```
def get_model(channels_last=False):
    model = torchvision.models.resnet50()
    if channels_last:
        model= model.to(memory_format=torch.channels_last)
    model = model.eval()
    return model

def get_input(batch_size, channels_last=False):
    batch = torch.randn(batch_size, 3, 224, 224)
    if channels_last:
        batch = batch.to(memory_format=torch.channels_last)
    return batch

batch_size = 8
model = get_model(channels_last=True)
batch = get_input(batch_size, channels_last=True)
infer_fn = get_inference_fn(model)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

Applying the _channels-last_ memory optimization, results in a further boost of 25% in throughput.

The impact of this optimization is most noticeable on models that have many convolutional layers. It is not expected to make a noticeable impact on other model architectures (e.g., transformer models).

Please see the [PyTorch documentation](https://docs.pytorch.org/tutorials/intermediate/memory_format_tutorial.html) for more details on the memory format optimization and the [Intel documentation](https://intel.github.io/intel-extension-for-pytorch/cpu/latest/tutorials/features/nhwc.html) for details on how this is implemented internally in oneDNN.

### Optimization 3: Automatic Mixed Precision

Modern Intel® Xeon® Scalable processors (from Gen3) include native support for the bfloat16 data type, a 16-bit floating point alternative to the standard float32. We can take advantage of this by applying PyTorch’s automatic mixed precision package, [torch.amp](https://pytorch.org/docs/stable/amp.html), as demonstrated below:

```
def get_inference_fn(model, enable_amp=False):
    def infer_fn(batch):
        with torch.inference_mode(), torch.amp.autocast(
                'cpu',
                dtype=torch.bfloat16,
                enabled=enable_amp
        ):
            output = model(batch)
        return output
    return infer_fn

batch_size = 8
model = get_model(channels_last=True)
batch = get_input(batch_size, channels_last=True)
infer_fn = get_inference_fn(model, enable_amp=True)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

The result of applying mixed precision is a throughput of 86.95 samples per second, 2.6 times the previous experiment and 3.8 times the baseline result.

Note that the use of a reduced precision floating point type can have an impact on numerical accuracy, and its effect on model quality performance must be evaluated.

### Optimization 4: Memory Allocation Optimization

Typical AI/ML workloads require the allocation and access of large blocks of memory. A number of optimization techniques are aimed at tuning the way memory is allocated and used during model execution. One common step is to replace the default system allocator (ptmalloc) with an alternative memory allocation libraries, such as [Jemalloc](https://github.com/jemalloc/jemalloc) and [TCMalloc](https://google.github.io/tcmalloc/overview.html), which have been shown to perform better on common AI/ML workloads (e.g., see [here](https://docs.pytorch.org/tutorials/recipes/xeon_run_cpu.html#choosing-an-optimized-memory-allocator)). To install [TCMalloc](https://google.github.io/tcmalloc/overview.html) run:

```
sudo apt-get install google-perftools
```

We program its use via the _LD\_PRELOAD_ environment variable:

```
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4 python main.py
```

This optimization results in another significant performance boost: 117.54 SPS, 35% higher than our previous experiment!!

### Optimization 5: Enable Huge Page Allocations

By default, the Linux kernel allocates memory in blocks of 4 KB, commonly referred to as pages. The mapping between the virtual and physical memory addresses is managed by the CPU’s Memory Management Unit (MMU), which uses a small hardware cache called the Translation Lookaside Buffer (TLB). The TLB is limited in the number entries it can hold. When you have _many_ small pages (as in large neural network models), the number of TLB cache misses can climb quickly, increasing latency and slowing down the speed of the program. A common way to address this is to use “huge pages” — blocks of 2 MB (or 1 GB) per page. This reduces the number of TLB entries required, improving memory access efficiency and lowering allocation latency.

```
export THP_MEM_ALLOC_ENABLE=1
```

In the case of our model, the impact is negligible. However, this is an important optimization for many AI/ML workloads.

### Optimization 6: IPEX

[Intel® Extension for PyTorch (IPEX)](https://intel.github.io/intel-extension-for-pytorch/cpu/latest/) is a library extension for PyTorch with the latest performance optimizations for Intel hardware. To install it we run:

```
pip install intel_extension_for_pytorch
```

In the code block below, we demonstrate the basic use of the [ipex.optimize](https://intel.github.io/intel-extension-for-pytorch/latest/tutorials/api_doc.html) API.

```
import intel_extension_for_pytorch as ipex

def get_model(channels_last=False, ipex_optimize=False):
    model = torchvision.models.resnet50()

    if channels_last:
        model= model.to(memory_format=torch.channels_last)

    model = model.eval()

    if ipex_optimize:
        model = ipex.optimize(model, dtype=torch.bfloat16)

    return model
```

The resultant throughout is 159.31 SPS, for another 36% performance boost.

## Get Chaim Rand’s stories in your inbox

Join Medium for free to get updates from this writer.

Subscribe

Subscribe

Please see the official documentation for more details on the many optimizations that IPEX has to offer.

### Optimization 7: Model Compilation

Another popular PyTorch optimization is torch.compile. Introduced in PyTorch 2.0, this just-in-time (JIT) compilation feature, performs kernel fusion and other optimizations. In a previous post we covered PyTorch compilation in great detail, covering some its many features, controls, and limitations. Here we demonstrate its basic use:

```
def get_model(channels_last=False, ipex_optimize=False, compile=False):
    model = torchvision.models.resnet50()

    if channels_last:
        model= model.to(memory_format=torch.channels_last)

    model = model.eval()

    if ipex_optimize:
        model = ipex.optimize(model, dtype=torch.bfloat16)

    if compile:
        model = torch.compile(model)

    return model
```

Applying torch.compile on the IPEX-optimized model results in a throughput of 144.5 SPS, which is lower than our previous experiment. In the case of our model, IPEX and torch.compile do not coexist well. When applying just the torch.compile the throughput is 133.36 SPS.

The general takeaway from this experiment is that, for a given model, any two optimization techniques could interfere with one another. This necessitates evaluating the impact of multiple configurations on the runtime performance of a given model in order to find the best one.

### Optimization 8: Auto-tune Environment Setup With `torch.xeon.run_cpu`

There are a number of environment settings that control thread and memory management and can be used to further fine-tune the runtime performance of an AI/ML workload. Rather than setting these manually, PyTorch offers the [torch.xeon.run\_cpu](https://docs.pytorch.org/tutorials/recipes/xeon_run_cpu.html) script that does this automatically. In preparation for the use of this script, we install Intel’s threading and multiprocessing libraries, [one TBB](https://www.intel.com/content/www/us/en/developer/tools/oneapi/onetbb.html) and [Intel OpenMP](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/pip.html). We also add a symbolic link to our [TCMalloc](https://google.github.io/tcmalloc/overview.html) installation.

```
# install TBB
sudo apt install -y libtbb12
# install openMP
pip install intel-openmp
# link to tcmalloc
sudo ln -sf /usr/lib/x86_64-linux-gnu/libtcmalloc.so.4 /usr/lib/libtcmalloc.so
```

In the case of our toy model, using torch.xeon.run\_cpu increases the throughput to 162.15 SPS — a slight increase over our previous maximum of 159.31 SPS.

Please see the [PyTorch documentation](https://docs.pytorch.org/tutorials/recipes/xeon_run_cpu.html) for more features of the `torch.xeon.run_cpu` and more details on the environment variables it applies.

### Optimization 9: Multi-worker **Inference**

Another popular technique for increasing resource utilization and scale is to load multiple instances of the AI model and run them in parallel in separate processes. Although this technique is more commonly applied on machines with many CPUs (separated into multiple [NUMA nodes](https://docs.pytorch.org/tutorials/recipes/xeon_run_cpu.html#applying-numa-access-control)) — not on our small 4-vCPU instance — we include it here for the sake of demonstration. In the script below we run 2 instances of our model in parallel:

```
python -m torch.backends.xeon.run_cpu --ninstances 2 main.py
```

This results in a throughput of 169.4 SPS — an additional modest but meaningful 4% increase.

### Optimization 10: **INT8 Quantization**

INT8 quantization is another common technique for accelerating AI model inference execution. In INT8 quantization, the floating point datatypes of the model weights and activations are replaced by 8-bit integers. Intel’s Xeon processors include dedicated accelerators for processing INT8 operations (e.g., see [here](https://pytorch.org/blog/int8-quantization/)). INT8 quantization can result in a meaningful increase in speed and a lower memory footprint. Importantly, the reduced bit-precision can have a significant impact on the quality of the model output. There are many different approaches to INT8 quantization some of which include calibration or retraining. There are also a wide variety of tools and libraries for applying quantization. A full discussion on the topic of quantization is beyond the scope of this post. Since in this post we are interested just in the potential performance impact, we demonstrate one quantization scheme using [TorchAO](https://github.com/pytorch/ao), without consideration of the impact on model quality. In the code block below, we implement [PyTorch 2 Export Quantization with X86 Backend through Inductor](https://docs.pytorch.org/ao/stable/tutorials_source/pt2e_quant_x86_inductor.html). Please see the documentation for the full details:

```
from torchao.quantization.pt2e.quantize_pt2e import prepare_pt2e, convert_pt2e
import torchao.quantization.pt2e.quantizer.x86_inductor_quantizer as xiq

def quantize_model(model):
    x = torch.randn(4, 3, 224, 224).contiguous(
                            memory_format=torch.channels_last)
    example_inputs = (x,)
    batch_dim = torch.export.Dim("batch")
    with torch.no_grad():
        exported_model = torch.export.export(
            model,
            example_inputs,
            dynamic_shapes=((batch_dim,
                             torch.export.Dim.STATIC,
                             torch.export.Dim.STATIC,
                             torch.export.Dim.STATIC),
                            )
        ).module()
    quantizer = xiq.X86InductorQuantizer()
    quantizer.set_global(xiq.get_default_x86_inductor_quantization_config())
    prepared_model = prepare_pt2e(exported_model, quantizer)
    prepared_model(*example_inputs)
    converted_model = convert_pt2e(prepared_model)
    optimized_model = torch.compile(converted_model)
    return optimized_model

batch_size = 8
model = get_model(channels_last=True)
model = quantize_model(model)
batch = get_input(batch_size, channels_last=True)
infer_fn = get_inference_fn(model, enable_amp=True)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

This results in a throughput of 172.67 SPS.

Please see [here](https://docs.pytorch.org/docs/2.9/quantization.html) for more details on quantization in PyTorch.

### Optimization 11: Graph Compilation and Execution With ONNX

There are a number of third party libraries that specialize in compiling PyTorch models into graph representations and optimizing them for runtime performance on target inference devices. One of the most popular libraries for this is [Open Neural Network Exchange](https://onnx.ai/) (ONNX). ONNX performs ahead-of-time compilation of AI/ML models and executes them using a dedicated runtime library.

While ONNX compilation support is included in PyTorch, we require the following library for executing an ONNX model:

```
pip install onnxruntime
```

In the code block below, we demonstrate ONNX compilation and model execution:

```
def export_to_onnx(model, onnx_path="resnet50.onnx"):
    dummy_input = torch.randn(4, 3, 224, 224)
    batch = torch.export.Dim("batch")
    torch.onnx.export(
        model,
        dummy_input,
        onnx_path,
        input_names=["input"],
        output_names=["output"],
        dynamic_shapes=((batch,
                         torch.export.Dim.STATIC,
                         torch.export.Dim.STATIC,
                         torch.export.Dim.STATIC),
                        ),
        dynamo=True
    )
    return onnx_path

def onnx_infer_fn(onnx_path):
    import onnxruntime as ort

    sess = ort.InferenceSession(
        onnx_path,
        providers=["CPUExecutionProvider"]
    )
    input_name = sess.get_inputs()[0].name

    def infer_fn(batch):
        result = sess.run(None, {input_name: batch})
        return result
    return infer_fn

batch_size = 8
model = get_model()
onnx_path = export_to_onnx(model)
batch = get_input(batch_size).numpy()
infer_fn = onnx_infer_fn(onnx_path)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

The resultant throughput is 44.92 SPS, far lower than in our previous experiments. In the case of our toy model, the ONNX runtime does not provide a benefit.

### Optimization 12: Graph Compilation and Execution with OpenVINO

Another opensource toolkit aimed at deploying highly performant AI solutions is [OpenVINO](https://docs.openvino.ai/2025/index.html). [OpenVINO](https://pypi.org/project/openvino/) is [highly optimized](https://www.intel.com/content/www/us/en/developer/tools/openvino-toolkit/overview.html) for model execution on Intel hardware — e.g., by fully leveraging the Intel AMX instructions. A common way to apply OpenVINO in PyTorch is to first convert the model to ONNX:

```
from openvino import Core

def compile_openvino_model(onnx_path):
    core = Core()
    model = core.read_model(onnx_path)
    compiled = core.compile_model(model, "CPU")
    return compiled

def openvino_infer_fn(compiled_model):
    def infer_fn(batch):
        result = compiled_model([batch])[0]
        return result
    return infer_fn

batch_size = 8
model = get_model()
onnx_path = export_to_onnx(model)
ovm = compile_openvino_model(onnx_path)
batch = get_input(batch_size).numpy()
infer_fn = openvino_infer_fn(ovm)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

The result of this optimization is a throughput of 297.33 SPS, nearly twice as fast as our previous best experiment!!

Please see the official documentation for more details on OpenVINO.

### Optimization 13: INT8 Quantization in OpenVINO with NNCF

As our final optimization, we revisit INT8 quantization, this time in the framework of [OpenVINO compilation](https://docs.openvino.ai/2025/openvino-workflow/model-optimization.html). As before, there are a number of methods for performing quantization — aimed at minimizing the impact on quality performance. Here we demonstrate the basic flow using the [NNCF](https://pypi.org/project/nncf/) library as documented [here](https://docs.openvino.ai/2025/openvino-workflow/model-optimization-guide/quantizing-models-post-training/basic-quantization-flow.html).

```
class RandomDataset(torch.utils.data.Dataset):

    def __len__(self):
        return 10000

    def __getitem__(self, idx):
        return torch.randn(3, 224, 224)

def nncf_quantize(onnx_path):
    import nncf

    core = Core()
    onnx_model = core.read_model(onnx_path)
    calibration_loader = torch.utils.data.DataLoader(RandomDataset())
    input_name = onnx_model.inputs[0].get_any_name()
    transform_fn = lambda data_item: {input_name: data_item.numpy()}
    calibration_dataset = nncf.Dataset(calibration_loader, transform_fn)
    quantized_model = nncf.quantize(onnx_model, calibration_dataset)
    return core.compile_model(quantized_model, "CPU")

batch_size = 8
model = get_model()
onnx_path = export_to_onnx(model)
q_model = nncf_quantize(onnx_path)
batch = get_input(batch_size).numpy()
infer_fn = openvino_infer_fn(q_model)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

This results in a throughput of 482.46(!!) SPS, another drastic improvement and over 18 times faster than our baseline experiment.

### Results

We summarize the results of our experiments in the table below:

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:700/1*SLjMENFtyz3ubjwWH4Mxkg.png)

ResNet50 Inference Experiment (by Author)

In the case of our toy model, the optimizations steps we demonstrated resulted in huge performance gains. Importantly, the impact of each optimization can vary greatly based on the details of the model. You may find that some of these techniques do not apply to your model, or do not result in improved performance. For example, when we reapply the same sequence of optimizations to a Vision Transformer (ViT) model, the resultant performance boost is 8.41X — still significant, but less than the 18.36X of our experiment. Please see the appendix to this post for details.

Our focus has been on runtime performance, but it is critical that you also evaluate the impact of each optimization on other metrics that are important to you — most importantly model quality.

There are, undoubtedly, many more optimization techniques that can be applied; we have merely scratched the surface. Hopefully, the steps we have presented here will set you on the right path.

## Summary

This post continues our [series](https://towardsdatascience.com/author/chaimrand/) on the important topic of AI/ML model runtime performance analysis and optimization. Our focus in this post was on model inference on Intel® Xeon® CPU processors. Given the ubiquity and prevalence of CPUs, the ability to execute models on them in a reliable and performant manner, can be extremely compelling. As we have shown, by applying a number of relatively simple techniques, we can achieve considerable gains in model performance with profound implications on inference costs and inference latency.

Please do not hesitate to reach out with comments, questions, or corrections.

## Appendix: Vision Transformer Optimization

To demonstrate how the impact of the runtime optimizations we discussed depend on the details of the AI/ML model, we reran our experiment on a Vision Transformer (ViT) model from the popular [timm](https://pypi.org/project/timm/) library:

```
from timm.models.vision_transformer import VisionTransformer

def get_model(channels_last=False, ipex_optimize=False, compile=False):
    model = VisionTransformer()

    if channels_last:
        model= model.to(memory_format=torch.channels_last)

    model = model.eval()

    if ipex_optimize:
        model = ipex.optimize(model, dtype=torch.bfloat16)

    if compile:
        model = torch.compile(model)

    return model
```

One modification in this experiment was to apply [OpenVINO compilation directly to the PyTorch model](https://docs.openvino.ai/2025/openvino-workflow/model-preparation/convert-model-pytorch.html) rather than an intermediate ONNX model. This was due to the fact that OpenVINO compilation failed on the ViT ONNX model. The revised [NNCF quantization](https://docs.openvino.ai/2025/openvino-workflow/model-optimization-guide/quantizing-models-post-training/basic-quantization-flow.html#) and OpenVINO compilation sequence is shown below:

```
import openvino as ov
import nncf

batch_size = 8
model = get_model()
calibration_loader = torch.utils.data.DataLoader(RandomDataset())
calibration_dataset = nncf.Dataset(calibration_loader)

# quantize PyTorch model
model = nncf.quantize(model, calibration_dataset)
ovm = ov.convert_model(model, example_input=torch.randn(1, 3, 224, 224))
ovm = ov.compile_model(ovm)
batch = get_input(batch_size).numpy()
infer_fn = openvino_infer_fn(ovm)
avg_time = benchmark(infer_fn, batch)
print(f"\nAverage samples per second: {(batch_size/avg_time):.2f}")
```

The table below summarizes the results of the optimizations discussed in this post when applied to the ViT model:

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:700/1*4nZpJIn0N68jggVrQq-UOw.png)

Vision Transformer Inference Experiment (by Author)

[Inference](https://medium.com/tag/inference?source=post_page-----ccd3aa5884ad---------------------------------------)

[Intel Xeon](https://medium.com/tag/intel-xeon?source=post_page-----ccd3aa5884ad---------------------------------------)

[Artificial Intelligence](https://medium.com/tag/artificial-intelligence?source=post_page-----ccd3aa5884ad---------------------------------------)

[Machine Learning](https://medium.com/tag/machine-learning?source=post_page-----ccd3aa5884ad---------------------------------------)

[Optimization](https://medium.com/tag/optimization?source=post_page-----ccd3aa5884ad---------------------------------------)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:48:48/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---post_author_info--ccd3aa5884ad---------------------------------------)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:64:64/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---post_author_info--ccd3aa5884ad---------------------------------------)

Follow

[**Written by Chaim Rand**](https://chaimrand.medium.com/?source=post_page---post_author_info--ccd3aa5884ad---------------------------------------)

[2.6K followers](https://chaimrand.medium.com/followers?source=post_page---post_author_info--ccd3aa5884ad---------------------------------------)

· [4 following](https://chaimrand.medium.com/following?source=post_page---post_author_info--ccd3aa5884ad---------------------------------------)

I am a Machine Learning Algorithm Developer. The views expressed in my posts are my own.

Follow

## Responses (3)

![](https://miro.medium.com/v2/resize:fill:32:32/1*dmbNkD5D-u45r44go_cf0g.png)

Write a response

[What are your thoughts?](https://medium.com/m/signin?operation=register&redirect=https%3A%2F%2Fchaimrand.medium.com%2Foptimizing-pytorch-model-inference-on-cpu-ccd3aa5884ad&source=---post_responses--ccd3aa5884ad---------------------respond_sidebar------------------)

Cancel

Respond

[![New Trend Computer Networks](https://miro.medium.com/v2/resize:fill:32:32/0*tfqPJ-onzHClKPTo)](https://medium.com/@ntcnllc?source=post_page---post_responses--ccd3aa5884ad----0-----------------------------------)

[New Trend Computer Networks](https://medium.com/@ntcnllc?source=post_page---post_responses--ccd3aa5884ad----0-----------------------------------)

[Oct 25, 2025](https://medium.com/@ntcnllc/this-article-provides-practical-insights-into-optimizing-pytorch-model-inference-on-intel-xeon-e12f1501b62c?source=post_page---post_responses--ccd3aa5884ad----0-----------------------------------)

```
This article provides practical insights into optimizing PyTorch model inference on Intel Xeon CPUs, focusing on performance gains.
```

5

Reply

[![Adeel](https://miro.medium.com/v2/resize:fill:32:32/0*Op3QkI6xZ9do0QAj)](https://medium.com/@adeel_7544?source=post_page---post_responses--ccd3aa5884ad----1-----------------------------------)

[Adeel](https://medium.com/@adeel_7544?source=post_page---post_responses--ccd3aa5884ad----1-----------------------------------)

[Oct 24, 2025](https://medium.com/@adeel_7544/thank-you-sir-c3acc75ae644?source=post_page---post_responses--ccd3aa5884ad----1-----------------------------------)

```
Thank you, sir.
```

Reply

[![Dori Eldar](https://miro.medium.com/v2/resize:fill:32:32/0*0bITuWj1tPGsVlTQ.)](https://medium.com/@dori.eldar?source=post_page---post_responses--ccd3aa5884ad----2-----------------------------------)

[Dori Eldar](https://medium.com/@dori.eldar?source=post_page---post_responses--ccd3aa5884ad----2-----------------------------------)

[Oct 19, 2025](https://medium.com/@dori.eldar/great-article-thanks-7e2103f4314a?source=post_page---post_responses--ccd3aa5884ad----2-----------------------------------)

```
Great article! Thanks
```

Reply

## More from Chaim Rand

![Optimizing Data Transfer in Distributed AI/ML Training Workloads](https://miro.medium.com/v2/resize:fit:679/format:webp/0*5ECuqkS8ZakfqhyP)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:20:20/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----0---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

[Chaim Rand](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----0---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

Jan 21

[A clap icon169](https://chaimrand.medium.com/optimizing-data-transfer-in-distributed-ai-ml-training-workloads-6607c26b8886?source=post_page---author_recirc--ccd3aa5884ad----0---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

![Optimizing Data Transfer in AI/ML Workloads](https://miro.medium.com/v2/resize:fit:679/format:webp/0*eNDJF2H1H7qqgqjn)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:20:20/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----1---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

[Chaim Rand](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----1---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

Dec 29, 2025

[A clap icon112\\
\\
A response icon2](https://chaimrand.medium.com/optimizing-data-transfer-in-ai-ml-workloads-60df62fe1278?source=post_page---author_recirc--ccd3aa5884ad----1---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

![Maximizing AI/ML Model Performance with PyTorch Compilation](https://miro.medium.com/v2/resize:fit:679/format:webp/0*suU0N8BuEj-LB731)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:20:20/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----2---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

[Chaim Rand](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----2---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

Aug 7, 2025

[A clap icon13\\
\\
A response icon2](https://chaimrand.medium.com/maximizing-ai-ml-model-performance-with-pytorch-compilation-7cdf840202e6?source=post_page---author_recirc--ccd3aa5884ad----2---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

![Optimizing Data Transfer in Batched AI/ML Inference Workloads](https://miro.medium.com/v2/resize:fit:679/format:webp/0*yBLmyPu8JVn0JkVh)

[![Chaim Rand](https://miro.medium.com/v2/resize:fill:20:20/1*u4pzP95sl2wOlLhWKFgczg.jpeg)](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----3---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

[Chaim Rand](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad----3---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

Jan 5

[A clap icon124](https://chaimrand.medium.com/optimizing-data-transfer-in-batched-ai-ml-inference-workloads-a9f4165208b8?source=post_page---author_recirc--ccd3aa5884ad----3---------------------507d5d08_c15d_4948_9c45_ece0883a64c4--------------)

[See all from Chaim Rand](https://chaimrand.medium.com/?source=post_page---author_recirc--ccd3aa5884ad---------------------------------------)

## Recommended from Medium

![7 MLflow Model Registry Practices That Age Well](https://miro.medium.com/v2/resize:fit:679/format:webp/1*FagqHO90fW4Zqv7kpgmdWw.png)

[![Nexumo](https://miro.medium.com/v2/resize:fill:20:20/1*ZsbgHlcAcVSKsILknh8-0w.png)](https://medium.com/@Nexumo_?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

[Nexumo](https://medium.com/@Nexumo_?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

Oct 8, 2025

[A clap icon120](https://medium.com/@Nexumo_/7-mlflow-model-registry-practices-that-age-well-4a526d0c9c64?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

![Passing the NVIDIA — Agentic AI Exam: Turning Practice into a Playbook](https://miro.medium.com/v2/resize:fit:679/format:webp/1*W3KrPNKpdqrNK3xRNZjQ1g.png)

[![Artificial Intelligence in Plain English](https://miro.medium.com/v2/resize:fill:20:20/1*9zAmnK08gUCmZX7q0McVKw@2x.png)](https://ai.plainenglish.io/?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

In

[Artificial Intelligence in Plain English](https://ai.plainenglish.io/?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

by

[Anton R Gordon](https://antonrgordon.medium.com/?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

Nov 29, 2025

[A clap icon6](https://antonrgordon.medium.com/passing-the-nvidia-agentic-ai-exam-turning-practice-into-a-playbook-0e617000268c?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

![I Built an AI System That Verifies Information and Shows Its Reasoning](https://miro.medium.com/v2/resize:fit:679/format:webp/1*Z54PHpY5PMI8bbJJRnAJnw.jpeg)

[![Data Science Collective](https://miro.medium.com/v2/resize:fill:20:20/1*0nV0Q-FBHj94Kggq00pG2Q.jpeg)](https://medium.com/data-science-collective?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

In

[Data Science Collective](https://medium.com/data-science-collective?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

by

[Umair Ali Khan, Ph.D.](https://medium.com/@umairali.khan?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

2d ago

[A clap icon21\\
\\
A response icon1](https://medium.com/@umairali.khan/how-i-built-an-ai-tool-for-disinformation-detection-d0c63aebcab5?source=post_page---read_next_recirc--ccd3aa5884ad----0---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

![8 PyTorch DataLoader Tactics to Max Out Your GPU](https://miro.medium.com/v2/resize:fit:679/format:webp/1*iK4MxptNYdCtyMKoMSfRpg.png)

[![Modexa](https://miro.medium.com/v2/resize:fill:20:20/1*Bbbx0xBeH6zv7huHknEcUw.png)](https://medium.com/@Modexa?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

[Modexa](https://medium.com/@Modexa?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

Oct 5, 2025

[A clap icon106\\
\\
A response icon2](https://medium.com/@Modexa/8-pytorch-dataloader-tactics-to-max-out-your-gpu-22270f6f3fa8?source=post_page---read_next_recirc--ccd3aa5884ad----1---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

![AI Benchmark Showdown: Speed & Scale of 4 ML Stacks](https://miro.medium.com/v2/resize:fit:679/format:webp/1*uZj7DVw7AZRaekbj0ldqXw.png)

[![Syntal](https://miro.medium.com/v2/resize:fill:20:20/1*JAgzZp1NLJfnVA4s_3wvHw.png)](https://medium.com/@sparknp1?source=post_page---read_next_recirc--ccd3aa5884ad----2---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

[Syntal](https://medium.com/@sparknp1?source=post_page---read_next_recirc--ccd3aa5884ad----2---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

Nov 13, 2025

[A clap icon13](https://medium.com/@sparknp1/ai-benchmark-showdown-speed-scale-of-4-ml-stacks-9622154c4bde?source=post_page---read_next_recirc--ccd3aa5884ad----2---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

![Real-Time Fraud Detection vs. Monthly Reports: When to Choose Batching or Streaming](https://miro.medium.com/v2/resize:fit:679/format:webp/0*WrDslSP-7pM-4nWZ)

[![Data Engineer Things](https://miro.medium.com/v2/resize:fill:20:20/1*HtZXPy85bDrTZm9tMXi6aQ.png)](https://blog.dataengineerthings.org/?source=post_page---read_next_recirc--ccd3aa5884ad----3---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

In

[Data Engineer Things](https://blog.dataengineerthings.org/?source=post_page---read_next_recirc--ccd3aa5884ad----3---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

by

[Henry](https://medium.com/@lhungen?source=post_page---read_next_recirc--ccd3aa5884ad----3---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

Oct 5, 2025

[A clap icon21](https://medium.com/@lhungen/real-time-fraud-detection-vs-monthly-reports-when-to-choose-batching-or-streaming-f4ecae14f8e1?source=post_page---read_next_recirc--ccd3aa5884ad----3---------------------126c3adc_13d0_4952_b082_6b5572c1cb51--------------)

[See more recommendations](https://medium.com/?source=post_page---read_next_recirc--ccd3aa5884ad---------------------------------------)

[Help](https://help.medium.com/hc/en-us?source=post_page-----ccd3aa5884ad---------------------------------------)

[Status](https://status.medium.com/?source=post_page-----ccd3aa5884ad---------------------------------------)

[About](https://medium.com/about?autoplay=1&source=post_page-----ccd3aa5884ad---------------------------------------)

[Careers](https://medium.com/jobs-at-medium/work-at-medium-959d1a85284e?source=post_page-----ccd3aa5884ad---------------------------------------)

[Press](mailto:pressinquiries@medium.com)

[Blog](https://blog.medium.com/?source=post_page-----ccd3aa5884ad---------------------------------------)

[Privacy](https://policy.medium.com/medium-privacy-policy-f03bf92035c9?source=post_page-----ccd3aa5884ad---------------------------------------)

[Rules](https://policy.medium.com/medium-rules-30e5502c4eb4?source=post_page-----ccd3aa5884ad---------------------------------------)

[Terms](https://policy.medium.com/medium-terms-of-service-9db0094a1e0f?source=post_page-----ccd3aa5884ad---------------------------------------)

[Text to speech](https://speechify.com/medium?source=post_page-----ccd3aa5884ad---------------------------------------)

reCAPTCHA

Recaptcha requires verification.

[Privacy](https://www.google.com/intl/en/policies/privacy/) \- [Terms](https://www.google.com/intl/en/policies/terms/)

protected by **reCAPTCHA**

[Privacy](https://www.google.com/intl/en/policies/privacy/) \- [Terms](https://www.google.com/intl/en/policies/terms/)