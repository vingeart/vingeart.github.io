@echo off
title ��ѹ�������ص�ͼƬ��

echo.
echo �����߿ɽ�ѹ�������ص�ͼƬ��
echo.

set /p picture_name= ����ͼƬ����������Ҫ��ͼƬ��ʽ�������Իس�����:
set /p compress_name= ����ѹ��������������Ҫ��ѹ����ʽ�������Իس�����:
setlocal enabledelayedexpansion

copy /b %picture_name%+%compress_name% �����ɵ�ͼƬ.png

echo.
echo �������µ�ͼƬ����ͼƬ��ʽ��Ϊrar����һЩ������ѹ������ʽ����
echo.

pause