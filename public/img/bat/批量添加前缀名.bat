@echo off
title �������ǰ׺�� 

echo.
echo ������������������ļ������ļ����������ļ����ǰ׺����
echo.

set /p file_type= �������ļ���ʽ(����չ�����Իس�����):
set /p add_str= ������Ҫ��ӵ�ǰ׺��(������ֱ�ӻس�):
setlocal enabledelayedexpansion

for /f "delims=" %%i in ('dir /a /b *.%file_type%') do (
ren "%%~i" "%add_str%%%i")

echo.
echo �ļ����Ѿ�ȫ���޸���ϣ�
echo.

pause