@echo off
setlocal enabledelayedexpansion

:: 1. ����Ŀ��Ŀ¼����Ĭ��
md D:\trouble 2>nul

:: 2. ����ԴĿ¼���߼�
set "SOURCE=C:\trouble"
set "SHORTCUTS=�˵���.lnk �Զ�����.lnk"

:: 3. ö�����з�ϵͳ�̶�Ӳ�̲�����
for /f "tokens=2 delims=," %%D in ('wmic logicaldisk where drivetype=3 get deviceid^,providername /format:csv') do (
    set drive=%%D
    if /i "!drive!" neq "C:" (
        xcopy "%SOURCE%\*" "!drive!\trouble\" /e/i/y/q
    )
)

:: 4. ���������ݷ�ʽ����Ĭ��������·����
xcopy "%SOURCE%\�˵���.lnk" "%USERPROFILE%\Desktop\�˵���.lnk" /i/y/q

:: 5. �����Զ������ݷ�ʽ������Ӳ�̸�Ŀ¼
for /f "tokens=2 delims=," %%D in ('wmic logicaldisk where drivetype=3 get deviceid^,providername /format:csv') do (
    set drive=%%D
    if /i "!drive!" neq "C:" (
        xcopy "%SOURCE%\�Զ�����.lnk" "!drive!\�Զ�����.lnk" /i/y/q
    )
)

exit /b 0