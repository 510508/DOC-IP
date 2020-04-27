

@echo off
title 万能DOC工具箱（FDLS）

color f0
:input
echo.  
echo. 
echo.     1（本地极域教室IP网络地址切换）    /      2（刷题IP地址切换并打开网址）
echo.  
echo. 
echo.     3（网卡重置刷新以及IP重置地址）    /      4（显示所有隐藏文件—防病毒）
echo.  
echo. 
echo.     5（调用((FTP 或 网络)) 及修复）    /      6（管理员权限调用命令行指令）
echo.  
echo. 
echo.     7（系统桌面快捷图标去除和还原）    /      8（清理系统垃圾及其缓存文件）    	
echo. 	
echo. 	
echo.     9（系统及软件全激活命令工具箱）    /     10（修改本机及网页Cookie时间）
echo.
echo.
echo.    11（JAVA写入环境变量   （Bug））    /     12（本程序部分重要EXE源码查看）
echo. 	
echo.	

set /p"num=请输入您的选项，到这里，然后按下回车键："


if "%num%"=="1" cls & goto 1
if "%num%"=="2" cls & goto 2
if "%num%"=="3" cls & goto 3
if "%num%"=="4" cls & goto 8
if "%num%"=="5" cls & goto 9
if "%num%"=="6" cls & goto 10
if "%num%"=="7" cls & goto 11
if "%num%"=="8" cls & goto 20
if "%num%"=="9" cls & goto 23
if "%num%"=="10" cls & goto 22
if "%num%"=="11" cls & goto 5
if "%num%"=="12" cls & goto 21
if "%num%"=="0000" cls & goto 39

echo. & echo 不能输入除了" 1" 或 " 2" 或 " 3" 或 " 4" 或" 5" 或" 6" 或" 7" 或" 9" 或" 10" 或" 11" 或" 12" 之外的其他字符！ & pause>nul & cls & goto input & Clear 

:1
set /p"IP=请输入先输入您的IP地址后3位进行地址切换："
if "%IP%"=="" cls & goto 19
echo 现在正在执行极域IP地址.
echo 正在设置您的IP地址，请稍等……
netsh interface ip set address name="以太网" static 192.168.181."%IP%" 255.255.255.0
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:2
echo 现在正在执行刷题IP地址切换并打开网址.
echo 正在设置自动获得刷题IP地址，请稍等……
netsh interface ip set address name="以太网" source=dhcp
 netsh interface ip set dns name="以太网" source=dhcp

set /p nums=“请选择你现有的浏览器(1.火狐浏览器 2.系统默认浏览器) 到这里，然后按下回车键："

if "%nums%"=="1" cls & goto 7
if "%nums%"=="2" cls & goto 6

echo. & echo 不能输入除了“1”或 "2" 之外的其他字符！& pause>nul & cls & goto input & Clear
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:3
set /p num=“网卡重置，确认请回复( y /n )，到这里，然后按下回车键（你的计算机会重启）："
if "%num%"=="y" cls & goto 4
if "%num%"=="n" cls & goto 5

echo. & echo 不能输入除了“y”和“n”之外的其他字符！ & pause>nul & cls & goto input 

:4
echo 正在执行命令，您的电脑将在一分钟后自动重启，请您保管好重要文件！
netsh winsock reset 
shutdown /r /t 60
echo 完成选择 - FDLS 
pause
pause>nul
cls & goto input

:5
echo 完成选择 - FDLS 
pause
pause>nul
cls & goto input

:6
echo 正在调用本地系统默认浏览器
start iexplore "www.qingniao.com"
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:7  
echo 正在调用本地火狐浏览器
start Firefox "www.qingniao.com"
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:8 
echo 显示所有隐藏文件-防病毒
for /f "delims=?" %%a in ('dir /a /b') do attrib -a -s -h -r "%%a"
@echo off 
echo 已在本程序的目录下显示所有的隐藏文件
echo 完成选择 - FDLS
pause>nul
cls & goto input

:9 
set /p"IP=请输入先输入您的IP地址后3位进行地址切换："
if "%IP%"=="" cls & goto 19
netsh interface ip set address name="以太网" static 192.168.181."%IP%" 255.255.255.0
set /p nums=“请选择要执行的命令 (1. FTP 或 2. 网络 3. 指令修复))-FDLS文件群，到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 15
if "%nums%"=="2" cls & goto 14 
if "%nums%"=="3" cls & goto 16

echo 注意：此选项的都会默认调用极域IP
echo. & echo 不能输入除了“1”或 "2" 之外的其他字符！& pause>nul & cls & goto input & Clear
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:10
echo 调用CMD命令行指令
start cmd
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:11
set /p nums=“请选择要执行的命令（1.去除快捷图标 2.还原快捷图标） 到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 12
if "%nums%"=="2" cls & goto 13
echo. & echo 不能输入除了“1”或 "2" 之外的其他字符！& pause>nul & cls & goto input & Clear
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:12
echo 快捷图标去除命令正在执行，请稍等……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:13
echo 快捷图标还原命令正在执行，请稍等……
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:14
echo 调用-FDLS文件群（网络）
start \\疯癫厉煞
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:15
echo 调用-FDLS文件群（FTP）
start iexplore "ftp://192.168.181.135:666"
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:16
set /p nums=“请选择要执行的命令（1.网络注册表修复指令 2.通过改变网络类型修复） 到这里，然后按下回车键："

if "%nums%"=="1" cls & goto 17
if "%nums%"=="2" cls & goto 18
echo. & echo 不能输入除了“1”或 "2" 之外的其他字符！& pause>nul & cls & goto input & Clear
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:17
echo 网络注册表修复指令正在执行，请稍等……
echo 提示：如果注册表中，提示有该文件的信息，选择覆盖“yes”即可
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v AllowlnsecureGuestAuth /t REG_DWORD /d 1
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:18
echo 通过改变网络类型修复正在执行，请稍等……
echo -------------------------（步骤说明——请仔细阅读）-------------------------
echo 1. 成功打开本地安全策略管理后
echo 2. 选择到网络列表管理器策略
echo 3. 将（网络、无法识别、正在访问）类型的网络全部设置为专用网络类型即可
echo 4. 一般情况下并不需要（重启电脑和重置网卡），若仍不可用，可继续执行，进一步调用指令
echo 5. 关闭本地安全策略就会出现是否进一步调用的命令
secpol.msc

set /p nums=“是否要继续执行进一步修复（y /n） 到这里，然后按下回车键："
if "%nums%"=="y" cls & goto 4
if "%nums%"=="n" cls & goto 5
echo. & echo 不能输入除了“y”和“n”之外的其他字符！ & pause>nul & cls & goto input 
pause
pause>nul
cls & goto input

:19
echo 对不起，后三位不能输入为空！
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:20
@echo off
echo 正在清理系统垃圾及安装残留文件，请稍等......
echo 提示：如果遇到进程被占用无法访问的问题，请耐心等待即可，可继续等待
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo  完成选择 - FDLS
pause>nul
cls & goto input

:21
set /p"IP=请输入先输入您的IP地址后3位进行地址切换："
if "%IP%"=="" cls & goto 19
netsh interface ip set address name="以太网" static 192.168.181."%IP%" 255.255.255.0
echo 本EXE程序由FDLS开发，仅显示部分重要源码
start \\疯癫厉煞\软件安装合集\网络相关文件（传输、修复、搭建、安全）\EXE源码.txt
echo.
echo 完成选择 - FDLS
pause>nul
cls & goto input

:22
echo 修改本机及网页Cookie时间
time 
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:23
echo 系统及软件全激活命令工具箱 （FDLS）
set /p"IP=请输入先输入您的IP地址后3位进行地址切换："
if "%IP%"=="" cls & goto 19
netsh interface ip set address name="以太网" static 192.168.181."%IP%" 255.255.255.0
set /p nums="请选择要执行的命令（1.系统激活 2.软件激活） 到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 24
if "%nums%"=="2" cls & goto 25
echo. & echo 不能输入除了“1”或 "2" 之外的其他字符！& pause>nul & cls & goto input & Clear
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:24
echo 系统激活指令（Windows系统）
set /p nums="请选择要执行的命令（1. DOC方式激活 2. 激活软件激活） 到这里，然后按下回车键："

if "%nums%"=="1" cls & goto 35
if "%nums%"=="2" cls & goto 36

echo. & echo 不能输入除了" 1" 或 " 2" 之外的其他字符！ & pause>nul & cls & goto input & Clear 
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:25
echo 软件激活指令（1-3年级学习软件）
set /p nums="请选择要执行的命令（1.Office软件 2.Visual Studio 3.Eclipse 4.Android Studio ∞待续） 到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 26
if "%nums%"=="2" cls & goto 27
if "%nums%"=="3" cls & goto 28
if "%nums%"=="4" cls & goto 29
echo. & echo 不能输入除了" 1" 或 " 2" 或 " 3" 或 " 4" 之外的其他字符！ & pause>nul & cls & goto input & Clear 
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:26
echo ok
set /p nums="请选择要执行的命令（1. 激活方式(1) 2. 激活方式(2) ） 到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 37
if "%nums%"=="2" cls & goto 38
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:27
start \\疯癫厉煞\软件安装合集\C#安装\VS激活.txt
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:28
start \\疯癫厉煞\软件安装合集\JAVA文件安装\破解文件\cracker.jar
start \\疯癫厉煞\软件安装合集\JAVA文件安装\破解文件\教程.pdf
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:29
start \\疯癫厉煞\软件安装合集\Android开发安装(双方案)\配置Eclipse安卓开发配置.png
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:30
echo 家庭版Windows激活程序正在运行，请稍等......
start \\疯癫厉煞\软件安装合集\网络自助激活工具\（家庭）.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:31
echo 教育版Windows激活程序正在运行，请稍等......
\\疯癫厉煞\软件安装合集\网络自助激活工具\（教育）.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:32
echo 专业版Windows激活程序正在运行，请稍等......
\\疯癫厉煞\软件安装合集\网络自助激活工具\（专业）.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:33
echo 企业版Windows激活程序正在运行，请稍等......
\\疯癫厉煞\软件安装合集\网络自助激活工具\（企业）.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:34
echo 工作站版Windows激活程序正在运行，请稍等......
\\疯癫厉煞\软件安装合集\网络自助激活工具\（工作站）.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:35
set /p nums="请选择要执行的命令（1.家庭版 2.教育版 3.专业版 4.企业版 5.工作站版） 到这里，然后按下回车键："
if "%nums%"=="1" cls & goto 30
if "%nums%"=="2" cls & goto 31
if "%nums%"=="3" cls & goto 32
if "%nums%"=="4" cls & goto 33
if "%nums%"=="5" cls & goto 34
echo. & echo 不能输入除了" 1" 或 " 2" 或 " 3" 或 " 4" 之外的其他字符！ & pause>nul & cls & goto input & Clear 
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:36
echo 已经调用FDLS网络群中的激活工具
start \\疯癫厉煞\系统安装合集\Windows系统安装\win10系统和office激活工具
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input


:37
echo 激活方式（1）Office激活
start \\疯癫厉煞\软件安装合集\网络自助激活工具\（1）激活.exe
echo 完成选择 - FDLS
pause
pause>nul
cls & goto input

:38
echo 激活方式（2）Office激活
start \\疯癫厉煞\软件安装合集\网络自助激活工具\（2）激活.exe
echo 完成选择 - FDLS
pause 
pause>nul
cls & goto input

:39
echo 开发者模式  - FDLS
start \\疯癫厉煞\软件安装合集\杂项\软件测试.txt
echo 完成选择 - FDLS
pause 
pause>nul
cls & goto input

:40
echo Java环境配置自动配置


