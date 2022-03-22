---
layout: post
title: 添加自定义插件到 Packages
category: [Unity]
tags: [插件, Packages]
published: True
---

`声明：模型和贴图来自网络，仅学习研究使用，如有侵权，请联系本人删除。禁止匿名转载；禁止商业使用。`

　　现在 Unity 新版本很多插件都是在 Packages Manager 中加载进项目工程中。

　　如果我们需要修改源码，那下次升级插件版本的时候，会覆盖掉前面所修改的源码。

　　所以想将需要修改源码的插件放在本地，升级插件的时候再手动替换，可以保证不覆盖修改过的源码。

　　为此我们可以在 Packages Manager 中加载完插件后，插件会保存在我们电脑本地Ｃ:\Users\admin\AppData\Local\Unity\cache\packages\packages.unity.com

<left><img src="/public/img/添加自定义插件到 Packages/1.png"></left>



　　然后再删除 Packages Manager 中的插件，在上面路径下找到对应的插件，复制到工程 Packages 目录下即可。

<left><img src="/public/img/添加自定义插件到 Packages/2.png"></left>

<left><img src="/public/img/添加自定义插件到 Packages/3.png"></left>



　　如果需要升级插件，可以在另外一个工程的 Packages Manager 中去升级，升级完后再去本地路径下找到新的版本进行替换。记得注意下我们修改过源码的文件。