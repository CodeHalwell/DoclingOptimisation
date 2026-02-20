[Skip to content](https://github.com/docling-project/docling-ibm-models/blob/main/docling_ibm_models/layoutmodel/layout_predictor.py#start-of-content)

You signed in with another tab or window. [Reload](https://github.com/docling-project/docling-ibm-models/blob/main/docling_ibm_models/layoutmodel/layout_predictor.py) to refresh your session.You signed out in another tab or window. [Reload](https://github.com/docling-project/docling-ibm-models/blob/main/docling_ibm_models/layoutmodel/layout_predictor.py) to refresh your session.You switched accounts on another tab or window. [Reload](https://github.com/docling-project/docling-ibm-models/blob/main/docling_ibm_models/layoutmodel/layout_predictor.py) to refresh your session.Dismiss alert

{{ message }}

[docling-project](https://github.com/docling-project)/ **[docling-ibm-models](https://github.com/docling-project/docling-ibm-models)** Public

- [Notifications](https://github.com/login?return_to=%2Fdocling-project%2Fdocling-ibm-models) You must be signed in to change notification settings
- [Fork\\
61](https://github.com/login?return_to=%2Fdocling-project%2Fdocling-ibm-models)
- [Star\\
186](https://github.com/login?return_to=%2Fdocling-project%2Fdocling-ibm-models)


## Collapse file tree

## Files

main

Search this repository

/

# layout\_predictor.py

Copy path

BlameMore file actions

BlameMore file actions

## Latest commit

[![cau-git](https://avatars.githubusercontent.com/u/60343111?v=4&size=40)](https://github.com/cau-git)[cau-git](https://github.com/docling-project/docling-ibm-models/commits?author=cau-git)

[feat: Add predict\_batch to layout predictor (](https://github.com/docling-project/docling-ibm-models/commit/93ce0ba4e97d46e37c3e29d578dd9dbbd56b83e5) [#125](https://github.com/docling-project/docling-ibm-models/pull/125) [)](https://github.com/docling-project/docling-ibm-models/commit/93ce0ba4e97d46e37c3e29d578dd9dbbd56b83e5)

Open commit detailsfailure

7 months agoJul 22, 2025

[93ce0ba](https://github.com/docling-project/docling-ibm-models/commit/93ce0ba4e97d46e37c3e29d578dd9dbbd56b83e5) · 7 months agoJul 22, 2025

## History

[History](https://github.com/docling-project/docling-ibm-models/commits/main/docling_ibm_models/layoutmodel/layout_predictor.py)

Open commit details

[View commit history for this file.](https://github.com/docling-project/docling-ibm-models/commits/main/docling_ibm_models/layoutmodel/layout_predictor.py) History

270 lines (228 loc) · 8.9 KB

/

# layout\_predictor.py

Top

## File metadata and controls

- Code

- Blame


270 lines (228 loc) · 8.9 KB

[Raw](https://github.com/docling-project/docling-ibm-models/raw/refs/heads/main/docling_ibm_models/layoutmodel/layout_predictor.py)

Copy raw file

Download raw file

Open symbols panel

Edit and raw actions

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

96

97

98

99

100

101

102

103

104

105

106

107

108

109

110

111

112

113

114

115

116

117

118

119

120

121

122

123

124

125

126

127

128

129

130

131

132

133

134

135

136

137

138

139

140

141

142

143

144

145

146

147

148

149

150

151

152

153

154

155

156

157

158

159

160

161

162

163

164

165

166

167

168

169

170

171

172

173

174

175

176

177

178

179

180

181

182

183

184

185

186

187

188

189

190

191

192

193

194

195

196

197

198

199

200

201

202

203

204

205

206

207

208

209

210

211

212

213

214

215

216

217

218

219

220

221

222

223

224

225

226

227

228

229

230

231

232

233

234

235

236

237

238

239

240

241

242

243

244

245

246

247

248

249

250

251

252

253

254

255

256

257

258

259

260

261

262

263

264

265

266

267

268

269

270

#

\# Copyright IBM Corp. 2024 - 2024

\# SPDX-License-Identifier: MIT

#

importlogging

importos

importthreading

fromcollections.abcimportIterable

fromtypingimportDict, List, Set, Union

importnumpyasnp

importtorch

fromPILimportImage

fromtorchimportTensor

fromtransformersimportAutoModelForObjectDetection, RTDetrImageProcessor

fromdocling\_ibm\_models.layoutmodel.labelsimportLayoutLabels

\_log=logging.getLogger(\_\_name\_\_)

\# Global lock for model initialization to prevent threading issues

\_model\_init\_lock=threading.Lock()

classLayoutPredictor:

"""

Document layout prediction using safe tensors

"""

def\_\_init\_\_(

self,

artifact\_path: str,

device: str="cpu",

num\_threads: int=4,

base\_threshold: float=0.3,

blacklist\_classes: Set\[str\] =set(),

):

"""

Provide the artifact path that contains the LayoutModel file

Parameters

 ----------

artifact\_path: Path for the model torch file.

device: (Optional) device to run the inference.

num\_threads: (Optional) Number of threads to run the inference if device = 'cpu'

Raises

 ------

FileNotFoundError when the model's torch file is missing

"""

\# Blacklisted classes

self.\_black\_classes=blacklist\_classes\# set(\["Form", "Key-Value Region"\])

\# Canonical classes

self.\_labels=LayoutLabels()

\# Set basic params

self.\_threshold=base\_threshold\# Score threshold

\# Set number of threads for CPU

self.\_device=torch.device(device)

self.\_num\_threads=num\_threads

ifdevice=="cpu":

torch.set\_num\_threads(self.\_num\_threads)

\# Load model file and configurations

self.\_processor\_config=os.path.join(artifact\_path, "preprocessor\_config.json")

self.\_model\_config=os.path.join(artifact\_path, "config.json")

self.\_st\_fn=os.path.join(artifact\_path, "model.safetensors")

ifnotos.path.isfile(self.\_st\_fn):

raiseFileNotFoundError("Missing safe tensors file: {}".format(self.\_st\_fn))

ifnotos.path.isfile(self.\_processor\_config):

raiseFileNotFoundError(

f"Missing processor config file: {self.\_processor\_config}"

)

ifnotos.path.isfile(self.\_model\_config):

raiseFileNotFoundError(f"Missing model config file: {self.\_model\_config}")

\# Load model and move to device

self.\_image\_processor=RTDetrImageProcessor.from\_json\_file(

self.\_processor\_config

)

\# Use lock to prevent threading issues during model initialization

with\_model\_init\_lock:

self.\_model=AutoModelForObjectDetection.from\_pretrained(

artifact\_path, config=self.\_model\_config, device\_map=self.\_device

)

self.\_model.eval()

\# Set classes map

self.\_model\_name=type(self.\_model).\_\_name\_\_

ifself.\_model\_name=="RTDetrForObjectDetection":

self.\_classes\_map=self.\_labels.shifted\_canonical\_categories()

self.\_label\_offset=1

else:

self.\_classes\_map=self.\_labels.canonical\_categories()

self.\_label\_offset=0

\_log.debug("LayoutPredictor settings: {}".format(self.info()))

definfo(self) ->dict:

"""

Get information about the configuration of LayoutPredictor

"""

info= {

"model\_name": self.\_model\_name,

"safe\_tensors\_file": self.\_st\_fn,

"device": self.\_device.type,

"num\_threads": self.\_num\_threads,

"image\_size": self.\_image\_processor.size,

"threshold": self.\_threshold,

}

returninfo

@torch.inference\_mode()

defpredict(self, orig\_img: Union\[Image.Image, np.ndarray\]) ->Iterable\[dict\]:

"""

Predict bounding boxes for a given image.

The origin (0, 0) is the top-left corner and the predicted bbox coords are provided as:

\[left, top, right, bottom\]

Parameter

 ---------

origin\_img: Image to be predicted as a PIL Image object or numpy array.

Yield

 -----

Bounding box as a dict with the keys: "label", "confidence", "l", "t", "r", "b"

Raises

 ------

TypeError when the input image is not supported

"""

\# Convert image format

ifisinstance(orig\_img, Image.Image):

page\_img=orig\_img.convert("RGB")

elifisinstance(orig\_img, np.ndarray):

page\_img=Image.fromarray(orig\_img).convert("RGB")

else:

raiseTypeError("Not supported input image format")

target\_sizes=torch.tensor(\[page\_img.size\[::-1\]\])

inputs=self.\_image\_processor(images=\[page\_img\], return\_tensors="pt").to(

self.\_device

)

outputs=self.\_model(\*\*inputs)

results: List\[Dict\[str, Tensor\]\] = (

self.\_image\_processor.post\_process\_object\_detection(

outputs,

target\_sizes=target\_sizes,

threshold=self.\_threshold,

)

)

w, h=page\_img.size

result=results\[0\]

forscore, label\_id, boxinzip(

result\["scores"\], result\["labels"\], result\["boxes"\]

):

score=float(score.item())

label\_id=int(label\_id.item()) +self.\_label\_offset

label\_str=self.\_classes\_map\[label\_id\]

\# Filter out blacklisted classes

iflabel\_strinself.\_black\_classes:

continue

bbox\_float= \[float(b.item()) forbinbox\]

l=min(w, max(0, bbox\_float\[0\]))

t=min(h, max(0, bbox\_float\[1\]))

r=min(w, max(0, bbox\_float\[2\]))

b=min(h, max(0, bbox\_float\[3\]))

yield {

"l": l,

"t": t,

"r": r,

"b": b,

"label": label\_str,

"confidence": score,

}

@torch.inference\_mode()

defpredict\_batch(

self, images: List\[Union\[Image.Image, np.ndarray\]\]

) ->List\[List\[dict\]\]:

"""

Batch prediction for multiple images - more efficient than calling predict() multiple times.

Parameters

 ----------

images : List\[Union\[Image.Image, np.ndarray\]\]

List of images to process in a single batch

Returns

 -------

List\[List\[dict\]\]

List of prediction lists, one per input image. Each prediction dict contains:

"label", "confidence", "l", "t", "r", "b"

"""

ifnotimages:

return \[\]

\# Convert all images to RGB PIL format

pil\_images= \[\]

forimginimages:

ifisinstance(img, Image.Image):

pil\_images.append(img.convert("RGB"))

elifisinstance(img, np.ndarray):

pil\_images.append(Image.fromarray(img).convert("RGB"))

else:

raiseTypeError("Not supported input image format")

\# Get target sizes for all images

target\_sizes=torch.tensor(\[img.size\[::-1\] forimginpil\_images\])

\# Process all images in a single batch

inputs=self.\_image\_processor(images=pil\_images, return\_tensors="pt").to(

self.\_device

)

outputs=self.\_model(\*\*inputs)

\# Post-process all results at once

results\_list: List\[Dict\[str, Tensor\]\] = (

self.\_image\_processor.post\_process\_object\_detection(

outputs,

target\_sizes=target\_sizes,

threshold=self.\_threshold,

)

)

\# Convert results to standard format for each image

all\_predictions= \[\]

forimg, resultsinzip(pil\_images, results\_list):

w, h=img.size

predictions= \[\]

forscore, label\_id, boxinzip(

results\["scores"\], results\["labels"\], results\["boxes"\]

):

score=float(score.item())

label\_id=int(label\_id.item()) +self.\_label\_offset

label\_str=self.\_classes\_map\[label\_id\]

\# Filter out blacklisted classes

iflabel\_strinself.\_black\_classes:

continue

bbox\_float= \[float(b.item()) forbinbox\]

l=min(w, max(0, bbox\_float\[0\]))

t=min(h, max(0, bbox\_float\[1\]))

r=min(w, max(0, bbox\_float\[2\]))

b=min(h, max(0, bbox\_float\[3\]))

predictions.append(

{

"l": l,

"t": t,

"r": r,

"b": b,

"label": label\_str,

"confidence": score,

}

)

all\_predictions.append(predictions)

returnall\_predictions

You can’t perform that action at this time.