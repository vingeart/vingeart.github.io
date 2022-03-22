@echo off
title 批量修改文件前缀名

echo.
echo 本批处理可批量修改本文件所在文件夹下所有文件的文件前缀名。
echo.

set /p file_type=请输入需要修改的文件格式(即扩展名并以回车结束):
set /p str1=请输入需要修改的文字(以回车结束):
set /p str2=请输入要改成的文字(若是删除则直接回车，以回车结束):

for /f "delims=" %%i in ('dir /b /a-d "*.%file_type%"' ) do (
set str3=%%i
setlocal EnableDelayedExpansion
set "str3=!str3:%str1%=%str2%!"
ren "%%i" "!str3!"
endlocal
)

echo.
echo 文件名已经全部修改完毕！
echo.

pause