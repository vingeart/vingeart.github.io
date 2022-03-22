@echo off
title 批量添加前缀名 

echo.
echo 本批处理可批量给本文件所在文件夹下所有文件添加前缀名。
echo.

set /p file_type= 请输入文件格式(即扩展名并以回车结束):
set /p add_str= 请输入要添加的前缀名(不变则直接回车):
setlocal enabledelayedexpansion

for /f "delims=" %%i in ('dir /a /b *.%file_type%') do (
ren "%%~i" "%add_str%%%i")

echo.
echo 文件名已经全部修改完毕！
echo.

pause