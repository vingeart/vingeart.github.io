@echo off
title 将压缩包隐藏到图片中

echo.
echo 本工具可将压缩包隐藏到图片中
echo.

set /p picture_name= 输入图片完整名（需要带图片格式），并以回车结束:
set /p compress_name= 输入压缩包完整名（需要带压缩格式），并以回车结束:
setlocal enabledelayedexpansion

copy /b %picture_name%+%compress_name% 新生成的图片.png

echo.
echo 已生成新的图片，将图片格式改为rar或者一些常见的压缩包格式即可
echo.

pause