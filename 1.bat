rd c:\trouble
md c:\trouble
cd /d %~dp0
xcopy 1.bat C:\trouble /s/e/i/y
xcopy 2.bat C:\trouble /s/e/i/y
xcopy 3.bat C:\trouble /s/e/i/y
xcopy 4.bat C:\trouble /s/e/i/y
xcopy 5.bat C:\trouble /s/e/i/y
xcopy 此电脑.lnk C:\trouble /s/e/i/y
xcopy 自动激活.lnk C:\trouble /s/e/i/y
start c:\trouble\2.bat
start c:\trouble\5.bat
exit