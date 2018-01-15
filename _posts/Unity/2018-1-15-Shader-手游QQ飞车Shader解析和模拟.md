---
layout: post
title: Shader-手游QQ飞车Shader解析和模拟
category: [Unity]
tags: [shaderforge, Shader, QQ飞车]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用。`


***解析模型效果，模型和贴图来自网络。以下做出的shader仅为个人根据游戏效果做出的临摹，非游戏源Shader。***

最近新出了手游版QQ飞车，日活跃突破2000W。所以想试下模拟该游戏效果。


## 先看看提取出来的贴图有哪些 ##
<left>
	<img src="/public/img/Shader-QQ飞车/1.png">
	<img src="/public/img/Shader-QQ飞车/2.png">
	<img src="/public/img/Shader-QQ飞车/3.png">
	</left>
<p></p>
<left>
	<img src="/public/img/Shader-QQ飞车/4.png">
	<img src="/public/img/Shader-QQ飞车/5.png">
	</left>

	
## 贴图分析 ##
漫反射贴图一张。

灯光闪烁贴图有两张。不知道为啥需要两张，个人预测一张在白天（亮的场景）使用，一张在夜晚（暗的场景）使用。也有可能是提供的改装贴图。

遮罩图有两张。不确定是否用在白天黑夜。因为不知道这两张图的作用，下面模拟的时候就没使用这两张图，而是重新做了一张Mask贴图。

从游戏效果上看有反射环境，所以应当还有张反射贴图。这张反射贴图是所有车公用的（可以是直接烘培场景的时候）。还有一张流光图。


## 模拟效果和参数 ##
<left>
	<img src="/public/img/Shader-QQ飞车/1.gif">
	<img src="/public/img/Shader-QQ飞车/6.png">
	<img src="/public/img/Shader-QQ飞车/7.png">
	<img src="/public/img/Shader-QQ飞车/8.png">
	<img src="/public/img/Shader-QQ飞车/9.png">
	</left>
	
	
## 参数功能 ##

|Color|主颜色|
|MainTex|主贴图|
|Flow Map|流光图|
|Flow Color|流光颜色。看了一下游戏的效果，有些流光不需要那么强，所以加个颜色参数控制亮度或者颜色。|
|Flow U|流光U方向速度。提取出来的模型看了一下，是有双UV在里面。流光使用的是第二套UV。|
|Flow V|流光V方向速度|
|CubeMap|环境光图。环境光图可以考虑直接烘培出来，也可以自己找一张效果好看的。|
|CubeIntensity|环境光强度|
|Mask|遮罩图。由于提取出来的两张遮罩图看不出是用来区分什么效果的，所以就自己重新做了一张Mask贴图，模拟出效果就好。|


