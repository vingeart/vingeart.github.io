---
layout: post
title: Beyond Compar图片对比
category: [研发工具]
tags: [Beyond Compar, 对比]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用；禁止个人使用。`


## **前言**
在游戏开发中，避免不了要对图片压缩，但是压缩程度需要控制。压缩力度大了，可能会失去原味。压缩力度小了，可能未达到减小内存的效果。

则需要对压缩后的图片进行对比，看看不同程度的压缩后，哪一张是我们可以接受的

这里使用Beyond Compar进行图片对比。

- [Beyond Compar](http://www.beyondcompare.cc/)是一款专业级的对比工具，不仅能对比图片。各种文件、文件夹都可以对比，功能很强大！可去官网参考[使用技巧](http://www.beyondcompare.cc/jiqiao/)。

## **对比图片**
将原图和压缩后的图片拖拽至Beyond Compar端口
或者新建一个图片比较的会话窗口，并选择路径加载文件。
<left>
	<img src="/public/img/Beyond Compar图片对比/01.png">
	<img src="/public/img/Beyond Compar图片对比/02.png"></left>

### **容差模式**
在下图中，上面两张是放对比的图片，可随时更换

在下图中，下面左边是缩放值和容差值。划动缩放值（也可以对准图片使用滚轮）可放大缩小对比框。容差值越小，差异的地方越明显。
<left>
	<img src="/public/img/Beyond Compar图片对比/03.png"></left>
灰色为和原图匹配的，蓝色为差异小的，红色为差异比较大的。

对于PNG的图片，如果需要边缘有过度的时候，则尽量选择边缘相对匹配的。如果效果两张压缩后的图片效果相差不了多少，就选内存小的。

### **不匹配范围模式**
黑色为匹配原图，土黄色为差异小的，黄色为差异比较大的
<left>
	<img src="/public/img/Beyond Compar图片对比/04.png"></left>




- 如果比较图片尺寸不一，其中的一个图片是另一个的裁剪版，可以拖动鼠标（或者使用小键盘的方向键移动）在不同的窗格中调整对比。
- 如果移动了对比图片，又难以恢复原位，可以点击重置差异偏移，即可恢复初始位置
<left>
	<img src="/public/img/Beyond Compar图片对比/05.png"></left>