[Skip to content](https://github.com/microsoft/onnxruntime/issues/26309#start-of-content)

You signed in with another tab or window. [Reload](https://github.com/microsoft/onnxruntime/issues/26309) to refresh your session.You signed out in another tab or window. [Reload](https://github.com/microsoft/onnxruntime/issues/26309) to refresh your session.You switched accounts on another tab or window. [Reload](https://github.com/microsoft/onnxruntime/issues/26309) to refresh your session.Dismiss alert

{{ message }}

[microsoft](https://github.com/microsoft)/ **[onnxruntime](https://github.com/microsoft/onnxruntime)** Public

- [Notifications](https://github.com/login?return_to=%2Fmicrosoft%2Fonnxruntime) You must be signed in to change notification settings
- [Fork\\
3.7k](https://github.com/login?return_to=%2Fmicrosoft%2Fonnxruntime)
- [Star\\
19.3k](https://github.com/login?return_to=%2Fmicrosoft%2Fonnxruntime)


# python 3.14 support\#26309

[New issue](https://github.com/login?return_to=https://github.com/microsoft/onnxruntime/issues/26309)

Copy link

[New issue](https://github.com/login?return_to=https://github.com/microsoft/onnxruntime/issues/26309)

Copy link

Open

Open

[python 3.14 support](https://github.com/microsoft/onnxruntime/issues/26309#top)#26309

Copy link

[![@ddatsh](https://avatars.githubusercontent.com/u/1809194?u=d68960109d49d9bb34724b622344da03a1c57698&v=4&size=80)](https://github.com/ddatsh)

## Description

[![@ddatsh](https://avatars.githubusercontent.com/u/1809194?u=d68960109d49d9bb34724b622344da03a1c57698&v=4&size=48)](https://github.com/ddatsh)

[ddatsh](https://github.com/ddatsh)

opened [on Oct 14, 2025on Oct 15, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issue-3516236064)

Issue body actions

### Describe the issue

pip install onnxruntime

ERROR: Could not find a version that satisfies the requirement onnxruntime (from versions: none)

ERROR: No matching distribution found for onnxruntime

### To reproduce

pip install onnxruntime

### Urgency

_No response_

### Platform

Windows

### OS Version

11

### ONNX Runtime Installation

Other / Unknown

### ONNX Runtime Version or Commit ID

latest

### ONNX Runtime API

Python

### Architecture

X64

### Execution Provider

Default CPU

### Execution Provider Library Version

_No response_

👍React with 👍30SergiiShcherbak, danieleds, alexvahter, matt-halliday, smortezah and 25 more😕React with 😕1reneleonhardt

## Activity

[Next](https://github.com/microsoft/onnxruntime/issues/26309?timeline_page=1)

[![amarjeet](https://avatars.githubusercontent.com/u/24115?v=4&size=80)](https://github.com/amarjeet)

### amarjeet commented on Oct 15, 2025on Oct 15, 2025

[![@amarjeet](https://avatars.githubusercontent.com/u/24115?v=4&size=48)](https://github.com/amarjeet)

[amarjeet](https://github.com/amarjeet)

[on Oct 15, 2025on Oct 15, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3405507095)

More actions

The onnxruntime package (required by chromadb, which is required by crewai) doesn't have pre-built wheels for Python 3.14.0 yet. This means that any project that uses crewai and wants to upgrade its Python env to 3.14 would not be able to do so.

👍React with 👍2Leif-W and Lords08

[![](https://avatars.githubusercontent.com/u/11633333?s=64&u=c3d7c19918cc1599c1c23a996bb56637a15b3eb5&v=4)cbornet](https://github.com/cbornet)

mentioned this [on Oct 17, 2025on Oct 17, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3644094232)

- [fix: support python 3.14 in various projects langchain-ai/langchain#33477](https://github.com/langchain-ai/langchain/pull/33477)


[![tianleiwu](https://avatars.githubusercontent.com/u/30328909?v=4&size=80)](https://github.com/tianleiwu)

### tianleiwu commented on Oct 17, 2025on Oct 17, 2025

[![@tianleiwu](https://avatars.githubusercontent.com/u/30328909?v=4&size=48)](https://github.com/tianleiwu)

[tianleiwu](https://github.com/tianleiwu)

[on Oct 17, 2025on Oct 17, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3416407162)

Contributor

More actions

we are working on it. Hopefully, we will have nightly package soon.

🎉React with 🎉15btakita, micheleriva, robert-oup, SergiiShcherbak, kkresideo and 10 more

[![cbornet](https://avatars.githubusercontent.com/u/11633333?u=c3d7c19918cc1599c1c23a996bb56637a15b3eb5&v=4&size=80)](https://github.com/cbornet)

### cbornet commented on Oct 22, 2025on Oct 22, 2025

[![@cbornet](https://avatars.githubusercontent.com/u/11633333?u=c3d7c19918cc1599c1c23a996bb56637a15b3eb5&v=4&size=48)](https://github.com/cbornet)

[cbornet](https://github.com/cbornet)

[on Oct 22, 2025on Oct 22, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3434255741)

More actions

Hello, is there any news for the package ?

👍React with 👍4yuanmaitian, danieleds, Leif-W and Lords08

[![yuanmaitian](https://avatars.githubusercontent.com/u/39802447?v=4&size=80)](https://github.com/yuanmaitian)

### yuanmaitian commented on Oct 22, 2025on Oct 22, 2025

[![@yuanmaitian](https://avatars.githubusercontent.com/u/39802447?v=4&size=48)](https://github.com/yuanmaitian)

[yuanmaitian](https://github.com/yuanmaitian)

[on Oct 22, 2025on Oct 22, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3434895194)

More actions

We wish to experience Python 3.14's free threading mode and aim to release an ONNX Runtime version compatible with Python 3.14 FT as soon as possible. We extend our sincere gratitude to all contributors!

👎React with 👎1Leif-W

[![cbornet](https://avatars.githubusercontent.com/u/11633333?u=c3d7c19918cc1599c1c23a996bb56637a15b3eb5&v=4&size=80)](https://github.com/cbornet)

### cbornet commented on Oct 23, 2025on Oct 23, 2025

[![@cbornet](https://avatars.githubusercontent.com/u/11633333?u=c3d7c19918cc1599c1c23a996bb56637a15b3eb5&v=4&size=48)](https://github.com/cbornet)

[cbornet](https://github.com/cbornet)

[on Oct 23, 2025on Oct 23, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3438378891)

More actions

Thanks for the answer. Just want to point that even if FT is nice, the most important issue right now is to not have binaries for Python 3.14.

I hope that this is not delayed by support of FT.

A lot of packages transitively depend on onxxruntime. Congrats for that ! But also all these packages are currently blocked to 3.13 because of this issue.

👍React with 👍29danieleds, alexvahter, mnawrotml, micheleriva, rclement and 24 more

[![](https://avatars.githubusercontent.com/u/3868450?s=64&u=24fc07f5acca1872097d7f09310c1a9dd7354a49&v=4)mgineer85](https://github.com/mgineer85)

mentioned this [on Oct 23, 2025on Oct 23, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3703462993)

- [Python 3.14 support photobooth-app/photobooth-app#595](https://github.com/photobooth-app/photobooth-app/issues/595)


[![](https://avatars.githubusercontent.com/u/1238873?s=64&u=fe1506b04debf76241447741b8da2136f2e5e8c5&v=4)rclement](https://github.com/rclement)

mentioned this [on Oct 25, 2025on Oct 25, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3716750747)

- [chore(deps): add support for python 3.14 datalpia/modelship#9](https://github.com/datalpia/modelship/pull/9)


[![](https://avatars.githubusercontent.com/u/97102151?s=64&u=d06bc719516d192834a6d0f5f2f097eaf8db17ef&v=4)dolfim-ibm](https://github.com/dolfim-ibm)

mentioned this [on Oct 27, 2025on Oct 27, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3729223386)

- [Python 3.14 support docling-project/docling#2479](https://github.com/docling-project/docling/issues/2479)


[![](https://avatars.githubusercontent.com/u/6198400?s=64&u=2e35717279c61a7edb185a353ec672655c90bb10&v=4)longcw](https://github.com/longcw)

mentioned this [on Oct 31, 2025on Oct 31, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3784228398)

- [Support Python 3.14.0 livekit/agents#3618](https://github.com/livekit/agents/issues/3618)


[![](https://avatars.githubusercontent.com/u/5725456?s=64&v=4)babenek](https://github.com/babenek)

mentioned this [on Nov 1, 2025on Nov 1, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3785816682)

- [Python 3.14 support & version UP v1.14.8 Samsung/CredSweeper#764](https://github.com/Samsung/CredSweeper/pull/764)


[![](https://avatars.githubusercontent.com/u/970403?s=64&v=4)carragom](https://github.com/carragom)

mentioned this [on Nov 2, 2025on Nov 2, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3793874093)

- [Python 3.14 support markitdown#1470](https://github.com/microsoft/markitdown/issues/1470)


[![Daniel451](https://avatars.githubusercontent.com/u/4680082?u=acda0be06f00ade26c6cf1c2ba0717a3038dc0ad&v=4&size=80)](https://github.com/Daniel451)

### Daniel451 commented on Nov 5, 2025on Nov 5, 2025

[![@Daniel451](https://avatars.githubusercontent.com/u/4680082?u=acda0be06f00ade26c6cf1c2ba0717a3038dc0ad&v=4&size=48)](https://github.com/Daniel451)

[Daniel451](https://github.com/Daniel451)

[on Nov 5, 2025on Nov 5, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3492664310) · edited by [Daniel451](https://github.com/Daniel451)

Edits

More actions

[@yuanmaitian](https://github.com/yuanmaitian)

> We wish to experience Python 3.14's free threading mode and aim to release an ONNX Runtime version compatible with Python 3.14 FT as soon as possible. We extend our sincere gratitude to all contributors!

That sounds very exciting! Can we expect a performance increase from the free-threaded version?

Additional question though: as far as I know, the GIL-enabled version will still be the default/standard for Python 3.14. Does that imply onnxruntime will have two different builds for 3.14? A GIL-enabled build and a free-threaded build? Or are you moving directly to free-threaded only?

[@tianleiwu](https://github.com/tianleiwu) can you share some information about the plan?

👍React with 👍1Leif-W

[![tianleiwu](https://avatars.githubusercontent.com/u/30328909?v=4&size=80)](https://github.com/tianleiwu)

### tianleiwu commented on Nov 5, 2025on Nov 5, 2025

[![@tianleiwu](https://avatars.githubusercontent.com/u/30328909?v=4&size=48)](https://github.com/tianleiwu)

[tianleiwu](https://github.com/tianleiwu)

[on Nov 5, 2025on Nov 5, 2025](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3492760325)

Contributor

More actions

> [@tianleiwu](https://github.com/tianleiwu) can you share some information about the plan?

See [#26473 (comment)](https://github.com/microsoft/onnxruntime/issues/26473#issuecomment-3492691567) for latest update.

👍React with 👍2Daniel451 and plutonium-239

[![](https://avatars.githubusercontent.com/u/979392?s=64&v=4)Leif-W](https://github.com/Leif-W)

mentioned this [on Nov 12, 2025on Nov 12, 2025](https://github.com/microsoft/onnxruntime/issues/26309#event-3895286066)

- [pip install piper-tts has onnxruntime dependency errors OHF-Voice/piper1-gpl#119](https://github.com/OHF-Voice/piper1-gpl/issues/119)


### 15 remaining items

Load more

[![Errorbot1122](https://avatars.githubusercontent.com/u/65428515?u=995d3a104d1759d7c80f9b9201372d01a028dc6e&v=4&size=80)](https://github.com/Errorbot1122)

### Errorbot1122 commented on Jan 13on Jan 13, 2026

[![@Errorbot1122](https://avatars.githubusercontent.com/u/65428515?u=995d3a104d1759d7c80f9b9201372d01a028dc6e&v=4&size=48)](https://github.com/Errorbot1122)

[Errorbot1122](https://github.com/Errorbot1122)

[on Jan 13on Jan 13, 2026](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3744239382) · edited by [Errorbot1122](https://github.com/Errorbot1122)

Edits

More actions

[@basnijholt](https://github.com/basnijholt)

Literally almost my exact issue, it's a downstream dependency, so the quicker 3.14 support release, the quicker other packages will support 3.14. This package is literally like a chain holding back the python community 😭

👍React with 👍15danieleds, basnijholt, leidix, graipher, SicklySilverMoon and 10 more😕React with 😕1reneleonhardt❤️React with ❤️1stonebig

[![](https://avatars.githubusercontent.com/u/6897215?s=64&u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4)basnijholt](https://github.com/basnijholt)

mentioned this [on Jan 14on Jan 14, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4367932781)

- [\[Feature Request\] Magika Dependency Optional markitdown#1234](https://github.com/microsoft/markitdown/issues/1234)


[![](https://avatars.githubusercontent.com/u/10203874?s=64&v=4)hirak99](https://github.com/hirak99)

mentioned this [on Jan 18on Jan 18, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4397472506)

- [Can it install with Python 3.14？ SYSTRAN/faster-whisper#1404](https://github.com/SYSTRAN/faster-whisper/issues/1404)


[![tusharkini](https://avatars.githubusercontent.com/u/55923175?v=4&size=80)](https://github.com/tusharkini)

### tusharkini commented last monthon Jan 19, 2026

[![@tusharkini](https://avatars.githubusercontent.com/u/55923175?v=4&size=48)](https://github.com/tusharkini)

[tusharkini](https://github.com/tusharkini)

[last monthon Jan 19, 2026](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3770088628)

More actions

Any update on the release timeline?

👍React with 👍13leidix, dpratt, danieleds, whyh, rlineweaver and 8 more😕React with 😕1reneleonhardt

[![](https://avatars.githubusercontent.com/u/153999?s=64&u=e96d2872d91ec2c4ac557ae8dc52adf945b8b520&v=4)Nayjest](https://github.com/Nayjest)

mentioned this [last monthon Jan 21, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4427476632)

- [Python 3.14 support Nayjest/ai-microcore#89](https://github.com/Nayjest/ai-microcore/pull/89)


[![](https://avatars.githubusercontent.com/u/6897215?s=64&u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4)basnijholt](https://github.com/basnijholt)

added a commit that references this issue [last monthon Jan 22, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-22218313513)

[fix: restrict Python to <3.14 due to onnxruntime compatibility](https://github.com/basnijholt/agent-cli/commit/08bae7ee15a38cb9a70abd11a3eb64f0943b88de)

...

[08bae7e](https://github.com/basnijholt/agent-cli/commit/08bae7ee15a38cb9a70abd11a3eb64f0943b88de)

[![](https://avatars.githubusercontent.com/u/6897215?s=64&u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4)basnijholt](https://github.com/basnijholt)

mentioned this [last monthon Jan 22, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4437618911)

- [fix: restrict Python to <3.14 due to onnxruntime compatibility basnijholt/agent-cli#284](https://github.com/basnijholt/agent-cli/pull/284)


[![](https://avatars.githubusercontent.com/u/6897215?s=64&u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4)basnijholt](https://github.com/basnijholt)

added a commit that references this issue [last monthon Jan 22, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-22218361842)

[fix: restrict Python to <3.14 due to onnxruntime compatibility (#284)\
\
* fix: restrict Python to <3.14 due to onnxruntime compatibility\
\
onnxruntime does not yet support Python 3.14.\
See: https://github.com/microsoft/onnxruntime/issues/26309](https://github.com/basnijholt/agent-cli/commit/e38112ddd5a7840a188dd29a21f360dc27a65466)

[fix: restrict Python to <3.14 due to onnxruntime compatibility (#284)\
\
* fix: restrict Python to <3.14 due to onnxruntime compatibility\
\
onnxruntime does not yet support Python 3.14.\
See: https://github.com/microsoft/onnxruntime/issues/26309](https://github.com/basnijholt/agent-cli/commit/e38112ddd5a7840a188dd29a21f360dc27a65466)

[fix: restrict Python to <3.14 due to onnxruntime compatibility (](https://github.com/basnijholt/agent-cli/commit/e38112ddd5a7840a188dd29a21f360dc27a65466) [#284](https://github.com/basnijholt/agent-cli/pull/284))

...

[e38112d](https://github.com/basnijholt/agent-cli/commit/e38112ddd5a7840a188dd29a21f360dc27a65466)

[![](https://avatars.githubusercontent.com/u/6897215?s=64&u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4)basnijholt](https://github.com/basnijholt)

mentioned this [last monthon Jan 24, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4451630883)

- [uvx and uv tool not respecting python version in packaged app astral-sh/uv#8206](https://github.com/astral-sh/uv/issues/8206)


[![](https://avatars.githubusercontent.com/u/53391375?s=64&u=911ebb833a1788b7336ed8050c80d9001c26a0fd&v=4)G36maid](https://github.com/G36maid)

mentioned this in 2 issues [3 weeks agoon Jan 26, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4468121678)

- [Extension fails to initialize on Python 3.14 (onnxruntime compatibility) G36maid/zed-mcp-server-markitdown#2](https://github.com/G36maid/zed-mcp-server-markitdown/issues/2)

- [Python 3.14 support: Dependency conflict with onnxruntime causes installation failure xkiranj/markitdown-mcp-npx#1](https://github.com/xkiranj/markitdown-mcp-npx/issues/1)


[![](https://avatars.githubusercontent.com/u/1641362?s=64&u=ee44585dcc8edf209d6132bb54069dcec0dbc52e&v=4)C0rn3j](https://github.com/C0rn3j)

mentioned this [3 weeks agoon Jan 30, 2026](https://github.com/microsoft/onnxruntime/issues/26309#event-4542079218)

- [When Onnxruntime support python 3.14 #26473](https://github.com/microsoft/onnxruntime/issues/26473)


[![C0rn3j](https://avatars.githubusercontent.com/u/1641362?u=ee44585dcc8edf209d6132bb54069dcec0dbc52e&v=4&size=80)](https://github.com/C0rn3j)

### C0rn3j commented 3 weeks agoon Jan 30, 2026

[![@C0rn3j](https://avatars.githubusercontent.com/u/1641362?u=ee44585dcc8edf209d6132bb54069dcec0dbc52e&v=4&size=48)](https://github.com/C0rn3j)

[C0rn3j](https://github.com/C0rn3j)

[3 weeks agoon Jan 30, 2026](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3823846619)

More actions

[#27130](https://github.com/microsoft/onnxruntime/issues/27130)

Looks like there's now a release candidate.

😄React with 😄5Errorbot1122, cbornet, fmmoret, Nriver and Lords08🎉React with 🎉4stonebig, fmmoret, purificant and Lords08👀React with 👀5reneleonhardt, fmmoret, Lords08, michelkluger and rioachuzia

[![Nayjest](https://avatars.githubusercontent.com/u/153999?u=e96d2872d91ec2c4ac557ae8dc52adf945b8b520&v=4&size=80)](https://github.com/Nayjest)

### Nayjest commented 2 weeks agoon Feb 2, 2026

[![@Nayjest](https://avatars.githubusercontent.com/u/153999?u=e96d2872d91ec2c4ac557ae8dc52adf945b8b520&v=4&size=48)](https://github.com/Nayjest)

[Nayjest](https://github.com/Nayjest)

[2 weeks agoon Feb 2, 2026](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3837232120)

More actions

Any ideas when that will go to stable build?

👀React with 👀5reneleonhardt, Lords08, michelkluger, pfhawkins and rioachuzia

[![basnijholt](https://avatars.githubusercontent.com/u/6897215?u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4&size=80)](https://github.com/basnijholt)

### basnijholt commented 2 weeks agoon Feb 3, 2026

[![@basnijholt](https://avatars.githubusercontent.com/u/6897215?u=a7d69832481ceabbd1a99ab22413a7141d2b1183&v=4&size=48)](https://github.com/basnijholt)

[basnijholt](https://github.com/basnijholt)

[2 weeks agoon Feb 3, 2026](https://github.com/microsoft/onnxruntime/issues/26309#issuecomment-3844339207)

More actions

It's happening [#27230](https://github.com/microsoft/onnxruntime/pull/27230) 🎉

[Sign up for free](https://github.com/signup?return_to=https://github.com/microsoft/onnxruntime/issues/26309)**to join this conversation on GitHub.** Already have an account? [Sign in to comment](https://github.com/login?return_to=https://github.com/microsoft/onnxruntime/issues/26309)

## Metadata

## Metadata

### Assignees

No one assigned

### Labels

No labels

No labels

### Type

No type

### Projects

No projects

### Milestone

No milestone

### Relationships

None yet

### Development

Code with agent mode

Select code repository

No branches or pull requests

### Participants

[![@amarjeet](https://avatars.githubusercontent.com/u/24115?s=64&v=4)](https://github.com/amarjeet)[![@Nayjest](https://avatars.githubusercontent.com/u/153999?s=64&u=e96d2872d91ec2c4ac557ae8dc52adf945b8b520&v=4)](https://github.com/Nayjest)[![@C0rn3j](https://avatars.githubusercontent.com/u/1641362?s=64&u=ee44585dcc8edf209d6132bb54069dcec0dbc52e&v=4)](https://github.com/C0rn3j)[![@ddatsh](https://avatars.githubusercontent.com/u/1809194?s=64&u=d68960109d49d9bb34724b622344da03a1c57698&v=4)](https://github.com/ddatsh)[![@Daniel451](https://avatars.githubusercontent.com/u/4680082?s=64&u=acda0be06f00ade26c6cf1c2ba0717a3038dc0ad&v=4)](https://github.com/Daniel451)

+7

## Issue actions

You can’t perform that action at this time.