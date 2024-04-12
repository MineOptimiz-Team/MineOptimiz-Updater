@echo off
copy .\config\fancymenu\assets\Update\Update.ps1 .\
echo 欢迎使用MineOptimiz Updater
echo MineOptimiz Updater现已经用PowerShell重写
echo 1.启动MineOptimiz Updater
echo 2.Win7/8.1 PowerShell补丁
echo 3.退出
set /p launchupdater=
if "%launchupdater%"=="1" (
  powershell .\Update.ps1
)
if "%launchupdater%"=="2" (
  echo 由于MineOptimiz Updater中使用的一些命令无法在PowerShell v5.1以下的版本中运行，因此如果你的系统是win7/8且没有更新，请安装该补丁
  echo 现在将会打开下载页面
  echo 如果你的系统是Windows 7 x64，请下载Win7AndW2K8R2-KB3191566-x64.zip
  echo 如果你的系统是Windows 7 x86，请下载Win7-KB3191566-x86.zip（注意！32位设备很快就会被淘汰！建议使用64位设备）
  echo 如果你的系统是Windows 8.1 x64，请下载Win8.1AndW2K12R2-KB3191564-x64.msu
  echo 如果你的系统是Windows 8.1 x86，请下载Win8.1-KB3191564-x86.msu（注意！32位设备很快就会被淘汰！建议使用64位设备）
  pause
  start https://www.microsoft.com/en-us/download/details.aspx?id=54616
  exit
)
if "%launchupdater%"=="3" (
  pause
  exit
)
