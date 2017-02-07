---
layout: post
title: DynamicBone模拟真实翅膀
category: [Unity]
tags: [模拟, 翅膀]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用；禁止个人使用。`


## fbx文件要求 ##
- 模型需要蒙皮，且骨骼不能使用复制对称的，否则会出现以下异样。

在下图中，蒙皮文件后的效果是对的。下图第一张是引擎内未播放时，右边的点已经有些不对了。第二张图是播放后，点已经被挪到别的地方了。
<left>
	<img src="/public/img/DynamicBone模拟真实翅膀/01.png">
	<img src="/public/img/DynamicBone模拟真实翅膀/02.png">
</left>

蒙皮后不需要K动画，直接导出即可。导出时不需要勾选动画。


## Unity设置 ##
导出的翅膀文件需要挂在一个空集上，并在该空集上挂上脚本DynamicBone，并在Root上添加该翅膀。
<left>
	<img src="/public/img/DynamicBone模拟真实翅膀/03.png">
</left>

翅膀文件可以将Animatro或者Animation组件删掉
<left>
	<img src="/public/img/DynamicBone模拟真实翅膀/04.png">
</left>


## DynamicBone脚本的各项属性功能 ##
- 常用参数：Damping、Elasticity、Stiffness、Inert、Distant Disable、Distance To Object

Root&nbsp;&nbsp;&nbsp;&nbsp;根文件
<br>
Update Rate&nbsp;&nbsp;&nbsp;&nbsp;更新频率，默认60。更新率越高越耗性能。
<br>
Damping&nbsp;&nbsp;&nbsp;&nbsp;阻尼
<br>
Damping Distrib&nbsp;&nbsp;&nbsp;&nbsp;阻尼分布，简单的效果建议不使用。
<br>
Elasticity&nbsp;&nbsp;&nbsp;&nbsp;弹力
<br>
Elasticity Distrib&nbsp;&nbsp;&nbsp;&nbsp;弹力分布
<br>
Stiffness&nbsp;&nbsp;&nbsp;&nbsp;硬度
<br>
Stiffness Distrib&nbsp;&nbsp;&nbsp;&nbsp;硬度分布
<br>
Inert&nbsp;&nbsp;&nbsp;&nbsp;迟缓
<br>
Inert Distrib&nbsp;&nbsp;&nbsp;&nbsp;迟缓分布
<br>
Radius&nbsp;&nbsp;&nbsp;&nbsp;半径
<br>
Radius Distrib&nbsp;&nbsp;&nbsp;&nbsp;半径分布
<br>
End Length&nbsp;&nbsp;&nbsp;&nbsp;末端长度
<br>
End Offset&nbsp;&nbsp;&nbsp;&nbsp;末端补偿，使用了末端长度，就不需要使用补偿。
<br>
Gravity&nbsp;&nbsp;&nbsp;&nbsp;重力
<br>
Force&nbsp;&nbsp;&nbsp;&nbsp;推力
<br>
Colliders&nbsp;&nbsp;&nbsp;&nbsp;碰撞，添加会被碰撞的物体
<br>
Exclusions&nbsp;&nbsp;&nbsp;&nbsp;排除，忽略某个地方的碰撞
<br>
Freeze Axis&nbsp;&nbsp;&nbsp;&nbsp;冻结轴向，冻结住后，该轴向运动时就不会产生计算
<br>
Distant Disable	  远距离禁用。需要配合参照物距离使用。当该物体离开超过这个距离，该脚本失效。当有参照物时，是根据参照物距离计算。当没有参照物时，则根据相机计算。建议勾上此选项，并不使用参照物，让其根据相机去计算。
<br>
Reference Object&nbsp;&nbsp;&nbsp;&nbsp;参照物。
<br>
Distance To Object&nbsp;&nbsp;&nbsp;&nbsp;与参照物的距离。


## DynamicBoneCollider脚本的各项属性功能 ##

Center&nbsp;&nbsp;&nbsp;&nbsp;中心偏移值
<br>
Radius&nbsp;&nbsp;&nbsp;&nbsp;半径
<br>
Height&nbsp;&nbsp;&nbsp;&nbsp;高度
<br>
Direction&nbsp;&nbsp;&nbsp;&nbsp;高度的方向
<br>
Bound&nbsp;&nbsp;&nbsp;&nbsp;范围
<br>
Outside&nbsp;&nbsp;&nbsp;&nbsp;使其阻挡在外面
<br>
Inside&nbsp;&nbsp;&nbsp;&nbsp;使其吸收到里面


## 附件 ##

[Dynamic Bone 1.1.8.unitypackage](http://pan.baidu.com/s/1bVWfV4)



