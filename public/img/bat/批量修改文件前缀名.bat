@echo off
title �����޸��ļ�ǰ׺��

echo.
echo ��������������޸ı��ļ������ļ����������ļ����ļ�ǰ׺����
echo.

set /p file_type=��������Ҫ�޸ĵ��ļ���ʽ(����չ�����Իس�����):
set /p str1=��������Ҫ�޸ĵ�����(�Իس�����):
set /p str2=������Ҫ�ĳɵ�����(����ɾ����ֱ�ӻس����Իس�����):

for /f "delims=" %%i in ('dir /b /a-d "*.%file_type%"' ) do (
set str3=%%i
setlocal EnableDelayedExpansion
set "str3=!str3:%str1%=%str2%!"
ren "%%i" "!str3!"
endlocal
)

echo.
echo �ļ����Ѿ�ȫ���޸���ϣ�
echo.

pause