[Skip to content](https://github.com/docling-project/docling/discussions/2173#start-of-content)

You signed in with another tab or window. [Reload](https://github.com/docling-project/docling/discussions/2173) to refresh your session.You signed out in another tab or window. [Reload](https://github.com/docling-project/docling/discussions/2173) to refresh your session.You switched accounts on another tab or window. [Reload](https://github.com/docling-project/docling/discussions/2173) to refresh your session.Dismiss alert

{{ message }}

[docling-project](https://github.com/docling-project)/ **[docling](https://github.com/docling-project/docling)** Public

- [Notifications](https://github.com/login?return_to=%2Fdocling-project%2Fdocling) You must be signed in to change notification settings
- [Fork\\
3.6k](https://github.com/login?return_to=%2Fdocling-project%2Fdocling)
- [Star\\
53.3k](https://github.com/login?return_to=%2Fdocling-project%2Fdocling)


# How to disable OCR and optimize performance in Docling-serve with Docker?  \#2173

[Answered](https://github.com/docling-project/docling/discussions/2173#discussioncomment-14287112) by [Elettrotecnica](https://github.com/Elettrotecnica "Elettrotecnica")

[Cyp9715](https://github.com/Cyp9715)

asked this question in
[Q&A](https://github.com/docling-project/docling/discussions/categories/q-a)

[How to disable OCR and optimize performance in Docling-serve with Docker?](https://github.com/docling-project/docling/discussions/2173#top)#2173

[![@Cyp9715](https://avatars.githubusercontent.com/u/16573620?s=40&v=4)\\
Cyp9715](https://github.com/Cyp9715)

on Sep 2, 2025Sep 2, 2025·
2 comments
·
8 replies


[Answered](https://github.com/docling-project/docling/discussions/2173#discussioncomment-14287112)by [Elettrotecnica](https://github.com/Elettrotecnica "Elettrotecnica")[Return to top](https://github.com/docling-project/docling/discussions/2173#top)

Discussion options

# {{title}}

Quote reply

edited

# {{editor}}'s edit

{{actor}} deleted this content
.

# {{editor}}'s edit

## [![](https://avatars.githubusercontent.com/u/16573620?s=64&v=4)\ Cyp9715](https://github.com/Cyp9715) [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussion-8830328)

Original comment in English -
Translate to English

|     |
| --- |
| Hello everyone,<br>I'm currently using Docling-serve and while Docling is excellent, the processing speed is quite slow for my use case.<br>I would like to optimize Docling-serve by:<br>1. Using DoclingParseV2DocumentBackend engine(If you have a faster option, please recommend it.)<br>2. Disabling OCR functionality (not needed for my workflow)<br>I can easily configure these settings in Python code, but I'm not sure how to properly set them up in a Docker deployment for Docling-serve.<br>```<br>docker run --name docling-serve \<br>    --gpus all \<br>    --restart unless-stopped \<br>    -d -p 5001:5001 \<br>    -e DOCLING_SERVE_MAX_SYNC_WAIT=1200 \<br>    -e DOCLING_SERVE_MAX_DOCUMENT_TIMEOUT=1200 \<br>    -e DOCLING_SERVE_ENG_LOC_NUM_WORKERS=2 \<br>    -e OMP_NUM_THREADS=4 \<br>    -e MKL_NUM_THREADS=4 \<br>    quay.io/docling-project/docling-serve-cu128<br>```<br>Also, I'd like to enable multicore and GPU (not sure if it's needed for plain text though...) to increase processing speed as much as possible.<br>Could you tell me about Docker deployment for this? |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

1You must be logged in to vote

All reactions

Answered by
[Elettrotecnica](https://github.com/Elettrotecnica)[on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173#discussioncomment-14287112)

I have opened an issue [open-webui/open-webui#17148](https://github.com/open-webui/open-webui/issues/17148)

[View full answer](https://github.com/docling-project/docling/discussions/2173#discussioncomment-14287112)

## Replies:   2 comments  ·  8 replies

Comment options

# {{title}}

Quote reply

### [![](https://avatars.githubusercontent.com/in/324583?s=64&v=4)\ dosubot\[bot\]](https://github.com/apps/dosubot) bot [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14281949)

Original comment in English -
Translate to English

|     |
| --- |
| Hi [@Cyp9715](https://github.com/Cyp9715)! I'm [Dosu](https://go.dosu.dev/dosubot) and I’m helping the docling team.<br>To use the DoclingParseV2DocumentBackend engine in Docker, set the environment variable `DOCLING_SERVE_ENGINE=DoclingParseV2DocumentBackend` in your `docker run` command. This backend does not perform OCR, so OCR will be effectively disabled by using it ( [source](https://github.com/docling-project/docling/issues/2159)).<br>For optimal performance, keep these settings in your Docker command:<br>- Set `DOCLING_SERVE_ENG_LOC_NUM_WORKERS`, `OMP_NUM_THREADS`, and `MKL_NUM_THREADS` to match your CPU resources for multicore processing ( [source](https://github.com/docling-project/docling/discussions/2008)).<br>- Use `--gpus all` and a CUDA-enabled image (like `docling-serve-cu128`) if you need GPU acceleration, but for plain text processing, GPU is usually not necessary—it's mainly beneficial for OCR and vision tasks ( [source](https://github.com/docling-project/docling/issues/1847)).<br>Your Docker command would look like:<br>```<br>docker run --name docling-serve \<br>    --network=ainet \<br>    --gpus all \<br>    --restart unless-stopped \<br>    -d -p 5001:5001 \<br>    -e DOCLING_SERVE_ENGINE=DoclingParseV2DocumentBackend \<br>    -e DOCLING_SERVE_MAX_SYNC_WAIT=1200 \<br>    -e DOCLING_SERVE_MAX_DOCUMENT_TIMEOUT=1200 \<br>    -e DOCLING_SERVE_ENG_LOC_NUM_WORKERS=2 \<br>    -e OMP_NUM_THREADS=4 \<br>    -e MKL_NUM_THREADS=4 \<br>    quay.io/docling-project/docling-serve-cu128<br>```<br>If you want to further tune performance, you can increase the worker and thread counts to match your hardware. Disabling enrichment steps and image generation (if not needed) can also help ( [source](https://github.com/docling-project/docling/issues/2120)). For most plain text workflows, CPU multicore scaling is the main lever for speed.<br>_To reply, just mention [@dosu](https://go.dosu.dev/dosubot)._<br>* * *<br>How did I do? [Good](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=great_response) \| [Irrelevant](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=irrelevant_answer) \| [Incorrect](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=incorrect_sources) \| [Verbose](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=too_verbose) \| [Hallucination](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=hallucination) \| [Report 🐛](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=bug_report) \| [Other](https://app.dosu.dev/response-feedback/718c641b-b07e-46bb-a4bf-53bd57fb25b5?feedback_type=other) [![Chat with Dosu](https://camo.githubusercontent.com/7c571478962a6b8a5d47cac74b6824c75e4f6731bba52377e6007f9150462923/68747470733a2f2f646f73752e6465762f646f73752d636861742d62616467652e737667)](https://app.dosu.dev/097760a8-135e-4789-8234-90c8837d7f1c/ask?utm_source=github) [![Join Discord](https://camo.githubusercontent.com/7d2066700925db1e370d956834f9ea0e5bc92cecbe84963fbd2a363e45091b4e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6a6f696e2d3538363546323f6c6f676f3d646973636f7264266c6f676f436f6c6f723d7768697465266c6162656c3d)](https://go.dosu.dev/discord-bot) [![Share on X](https://camo.githubusercontent.com/a8bd7f3fcf3f5e3bd124eee9ae50ae2ac17b40971726665ac2121d48f9aee155/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f582d73686172652d626c61636b)](https://twitter.com/intent/tweet?text=%40dosu_ai%20helped%20me%20solve%20this%20issue!&url=https%3A//github.com/docling-project/docling/discussions/2173) |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

0You must be logged in to vote

All reactions

0 replies


Comment options

# {{title}}

Quote reply

edited

# {{editor}}'s edit

{{actor}} deleted this content
.

# {{editor}}'s edit

### [![](https://avatars.githubusercontent.com/u/16573620?s=64&v=4)\ Cyp9715](https://github.com/Cyp9715) [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14283019)   Author

Original comment in English -
Translate to English

|     |
| --- |
| [@dosu](https://github.com/dosu)<br>No, as a result of testing on Python, the time difference is about twice as much depending on the on/off of the OCR option.<br>```<br>pipeline_options = PdfPipelineOptions()<br>pipeline_options.do_ocr = False # Default True, Doubles the time when changing to True.<br>converter = DocumentConverter(<br>    format_options={<br>        InputFormat.PDF: PdfFormatOption(<br>            pipeline_options=pipeline_options,<br>            backend=DoclingParseV2DocumentBackend<br>        )<br>    }<br>)<br>``` |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

1You must be logged in to vote

All reactions

8 replies


Show 3 previous replies

[![@Cyp9715](https://avatars.githubusercontent.com/u/16573620?s=60&v=4)](https://github.com/Cyp9715)

Comment options

# {{title}}

Quote reply

#### [Cyp9715](https://github.com/Cyp9715) [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14283480)   Author

Original comment in English -
Translate to English

|     |
| --- |
| [@dosu](https://github.com/dosu)<br>The problem is that I am using OpenWebUI.<br>Do you know how to put these options in OpenWebUI and transfer them?<br>Or do you know how to test with Curl?<br>Please show an example of the appropriate command. |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

All reactions

[![@dosubot](https://avatars.githubusercontent.com/in/324583?s=60&v=4)](https://github.com/apps/dosubot)

Comment options

# {{title}}

Quote reply

#### [dosubot\[bot\]](https://github.com/apps/dosubot) bot [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14283528)

Original comment in English -
Translate to English

|     |
| --- |
| To disable OCR and select the DoclingParseV2DocumentBackend in Docling-serve, you need to set the options per API request. OpenWebUI does not appear to expose these advanced options directly in its UI, so you may not be able to set them there unless it has a custom "advanced options" panel or lets you edit the raw API payload.<br>You can test these options directly with curl. Here are two examples:<br>**For a document URL:**<br>```<br>curl -X POST \<br>  'http://localhost:5001/v1/convert/source' \<br>  -H 'accept: application/json' \<br>  -H 'Content-Type: application/json' \<br>  -d '{<br>    "options": {<br>      "do_ocr": false,<br>      "pdf_backend": "dlparse_v2"<br>    },<br>    "http_sources": [{"url": "https://example.com/document.pdf"}]<br>  }'<br>```<br>**For a local file:**<br>```<br>curl -X POST \<br>  'http://localhost:5001/v1/convert/file' \<br>  -H 'accept: application/json' \<br>  -H 'Content-Type: multipart/form-data' \<br>  -F 'pdf_backend=dlparse_v2' \<br>  -F 'do_ocr=false' \<br>  -F 'files=@yourfile.pdf;type=application/pdf'<br>```<br>These commands will disable OCR and use the dlparse\_v2 backend for PDF processing ( [reference](https://github.com/docling-project/docling-serve/blob/e5449472b2a3e71796f41c8a58c251d8229305c1/docs/usage.md)).<br>If OpenWebUI doesn't let you set these options, using curl or a tool like Postman is the best way to ensure the settings are applied. If OpenWebUI adds support for advanced options in the future, look for fields named `do_ocr` and `pdf_backend`.<br>_To reply, just mention [@dosu](https://go.dosu.dev/dosubot)._<br>* * *<br>How did I do? [Good](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=great_response) \| [Irrelevant](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=irrelevant_answer) \| [Incorrect](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=incorrect_sources) \| [Verbose](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=too_verbose) \| [Hallucination](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=hallucination) \| [Report 🐛](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=bug_report) \| [Other](https://app.dosu.dev/response-feedback/20370350-589a-41db-9fcc-f813c42271d3?feedback_type=other) [![Chat with Dosu](https://camo.githubusercontent.com/7c571478962a6b8a5d47cac74b6824c75e4f6731bba52377e6007f9150462923/68747470733a2f2f646f73752e6465762f646f73752d636861742d62616467652e737667)](https://app.dosu.dev/097760a8-135e-4789-8234-90c8837d7f1c/ask?utm_source=github) [![Join Discord](https://camo.githubusercontent.com/7d2066700925db1e370d956834f9ea0e5bc92cecbe84963fbd2a363e45091b4e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6a6f696e2d3538363546323f6c6f676f3d646973636f7264266c6f676f436f6c6f723d7768697465266c6162656c3d)](https://go.dosu.dev/discord-bot) [![Share on X](https://camo.githubusercontent.com/a8bd7f3fcf3f5e3bd124eee9ae50ae2ac17b40971726665ac2121d48f9aee155/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f582d73686172652d626c61636b)](https://twitter.com/intent/tweet?text=%40dosu_ai%20helped%20me%20solve%20this%20issue!&url=https%3A//github.com/docling-project/docling/discussions/2173) |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

All reactions

[![@Elettrotecnica](https://avatars.githubusercontent.com/u/3331940?s=60&v=4)](https://github.com/Elettrotecnica)

Comment options

# {{title}}

Quote reply

#### [Elettrotecnica](https://github.com/Elettrotecnica) [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14286931)

Original comment in English -
Translate to English

|     |
| --- |
| > [@dosu](https://github.com/dosu)<br>> <br>> The problem is that I am using OpenWebUI. Do you know how to put these options in OpenWebUI and transfer them?<br>> <br>> Or do you know how to test with Curl? Please show an example of the appropriate command.<br>Yes, it seems openwebui does not allow to turn off OCR, set the pdf backend, or even the table extraction mode at this time. The relevant code should start here [https://github.com/open-webui/open-webui/blob/2407d9b905978d68619bdce4021e424046ec8df9/backend/open\_webui/retrieval/loaders/main.py#L151](https://github.com/open-webui/open-webui/blob/2407d9b905978d68619bdce4021e424046ec8df9/backend/open_webui/retrieval/loaders/main.py#L151)<br>This should improve IMO, these settings impact docling performance a lot and would be helpful to be able to change them. |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

All reactions

[![@Elettrotecnica](https://avatars.githubusercontent.com/u/3331940?s=60&v=4)](https://github.com/Elettrotecnica)

Comment options

# {{title}}

Quote reply

#### [Elettrotecnica](https://github.com/Elettrotecnica) [on Sep 2, 2025Sep 2, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14287112)

Original comment in English -
Translate to English

|     |
| --- |
| I have opened an issue [open-webui/open-webui#17148](https://github.com/open-webui/open-webui/issues/17148) |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

Marked as answer

![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)1

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)1

Answer selected by [Cyp9715](https://github.com/Cyp9715)

[![@Cyp9715](https://avatars.githubusercontent.com/u/16573620?s=60&v=4)](https://github.com/Cyp9715)

Comment options

# {{title}}

Quote reply

#### [Cyp9715](https://github.com/Cyp9715) [on Sep 3, 2025Sep 3, 2025](https://github.com/docling-project/docling/discussions/2173\#discussioncomment-14292776)   Author

Original comment in English -
Translate to English

|     |
| --- |
| [@Elettrotecnica](https://github.com/Elettrotecnica)<br>Thank you.<br>Also, while allowing the client-side to handle the on/off behavior of this feature offers great flexibility, I think it would be better to have an option for the server to enforce it.<br>This is an area for improvement not only in OpenWebUI but also in Docling. |

BetaWas this translation helpful? [Give feedback.](https://github.com/docling-project/docling/discussions/2173#)

All reactions

[Sign up for free](https://github.com/join?source=comment-repo) **to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2Fdocling-project%2Fdocling%2Fdiscussions%2F2173)

Category


[![pray](https://github.githubassets.com/assets/1f64f-25af8353fbea.png)\\
\\
Q&A](https://github.com/docling-project/docling/discussions/categories/q-a)

Labels


None yet


2 participants


[![@Cyp9715](https://avatars.githubusercontent.com/u/16573620?s=48&v=4)](https://github.com/Cyp9715)[![@Elettrotecnica](https://avatars.githubusercontent.com/u/3331940?s=48&v=4)](https://github.com/Elettrotecnica)

Heading

Bold

Italic

Quote

Code

Link

* * *

Numbered list

Unordered list

Task list

* * *

Attach files

Mention

Reference

# Select a reply

Loading

[Create a new saved reply](https://github.com/docling-project/docling/discussions/2173)

👍1 reacted with thumbs up emoji👎1 reacted with thumbs down emoji😄1 reacted with laugh emoji🎉1 reacted with hooray emoji😕1 reacted with confused emoji❤️1 reacted with heart emoji🚀1 reacted with rocket emoji👀1 reacted with eyes emoji

You can’t perform that action at this time.