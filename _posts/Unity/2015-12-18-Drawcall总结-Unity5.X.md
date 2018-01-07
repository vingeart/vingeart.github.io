---
layout: post
title: Drawcall总结-Unity5.X
category: [Unity]
tags: [Drawcall]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用。`


## 什么叫做Drawcall

CPU每传递一次需要渲染的物体信息给GPU，就算一次Drawcall。

NVIDIA 公司的一片分析3D引擎批次优化的讲稿中曾提到
<left>
<img src="/public/img/img/Drawcall总结-Unity5.X-01.png">
</left>

（此处引用链接：[http://www.docin.com/p-86211558.html](http://www.docin.com/p-86211558.html) 第24页）

大致意思是：25K batchs/s在100%的使用率下会消耗1GHz 的 CPU。

并举例：假设目标需要跑30帧；使用2GHz CPU；使用率20%/设定状态

25K*2GHz*20%/30fps=333batches/每帧

并推出了一条公式，来预估游戏中大概每帧可以处理多少个Batch：

Formula：25K*GHz*Percentage/Framerate

-GHz = target spec CPU frequency

-Percentage = value 0..1corresponding to CPU Percentage available for Draw/SetState calls

-Framerate = target trame rate in fps


## 翻译
大意可翻译为

公式：25K*GHz*百分比/帧速率

-GHz = 目标规范CPU频率

-百分比=值0到1对应CPU的百分比有效工作量用于Draw call

-帧速率=目标的fps

 

例如：打算这款游戏跑30fps、使用的手机CPU频率为1.3GHz（iPhone5S的CPU配置）、20%的有效工作量分给Draw call。那么每一帧可以处理的Draw call为：

25K*1.3*0.2/30=216

 

**需要注意的是，静态批量处理的物体需要额外的内存开销，必要时减少一些静态物体去减少内存的开销。**