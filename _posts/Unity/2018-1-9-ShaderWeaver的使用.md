---
layout: post
title: ShaderWeaver的使用
category: [Unity]
tags: [下载, 路径]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用。`


## 原图
<left>
	<img src="/public/img/ShaderWeaver的使用/1.png">
	</left>

	
## 效果
<left>
	<img src="/public/img/ShaderWeaver的使用/2.png">
	</left>	

	
## 参数
<left>
	<img src="/public/img/ShaderWeaver的使用/3.png">
	</left>

	
## 节点分析
总节点
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/4.png">
	</left>
ROOT放背景贴图。

想放置在背景上的贴图均用Image节点。

Depth控制贴图的深度。数值大的遮挡数值小的。背景的Depth值默认为0。

image1在背景的上层，在image1上加遮罩mask1，在这个遮罩区域内做uv1的变化。

image2在image1的上层。

image3在image2的上层，在image2上加遮罩mask2，在这个遮罩区域叠加image4。

Image1
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/5.png">
	</left>
<p></p>
添加了Image节点后，点击Select添加图片，再点击Edit进入该编辑面板。

在该面板中可调节图片的位置和缩放大小。

如果不是四方连续的贴图，就不要勾选LOOP，否则图片边缘会有闪烁。

Mask1
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/6.png">
	</left>
遮罩节点。使用Brush笔刷工具，刷出Image1图片上想要做出特殊效果的区域。
	
UV1	
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/7.png">
	</left>
让刚刚画出的遮罩区域做UV的移动处理。

0.7是该效果的强度。

Image2
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/8.png">
	</left>
Image2以Screen混合效果叠加在底层上

Image3	
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/9.png">
	</left>
Image3以Add Inner混合效果叠加在底层上
	
Mask2
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/10.png">
	</left>
遮罩节点。使用Brush笔刷工具，刷出Image3图片上想要做出特殊效果的区域。
	
Image4
<p></p>
<left>
	<img src="/public/img/ShaderWeaver的使用/11.png">
	</left>
让刚刚画出的遮罩区域以Add Inner混合模式叠加Image4贴图。

Image4贴图做位移，沿Y轴间隔4次循环播放。

## 总结
image1在背景的上层，在image1上加遮罩mask1，在这个遮罩区域内以UV1贴图做UV偏移。

image2以Screen混合模式叠加在image1和背景上面。

image3在image2的上层，在image3上加遮罩mask2，在这个遮罩区域叠加image4。

image4以Add Inner混合模式叠加在image3的遮罩区域上。沿着Y轴间隔4次循环播放一次。
