@echo off
copy .\config\fancymenu\assets\Update\Update.ps1 .\
echo ��ӭʹ��MineOptimiz Updater
echo MineOptimiz Updater���Ѿ���PowerShell��д
echo 1.����MineOptimiz Updater
echo 2.Win7/8.1 PowerShell����
echo 3.�˳�
set /p launchupdater=
if "%launchupdater%"=="1" (
  powershell .\Update.ps1
)
if "%launchupdater%"=="2" (
  echo ����MineOptimiz Updater��ʹ�õ�һЩ�����޷���PowerShell v5.1���µİ汾�����У����������ϵͳ��win7/8��û�и��£��밲װ�ò���
  echo ���ڽ��������ҳ��
  echo ������ϵͳ��Windows 7 x64��������Win7AndW2K8R2-KB3191566-x64.zip
  echo ������ϵͳ��Windows 7 x86��������Win7-KB3191566-x86.zip��ע�⣡32λ�豸�ܿ�ͻᱻ��̭������ʹ��64λ�豸��
  echo ������ϵͳ��Windows 8.1 x64��������Win8.1AndW2K12R2-KB3191564-x64.msu
  echo ������ϵͳ��Windows 8.1 x86��������Win8.1-KB3191564-x86.msu��ע�⣡32λ�豸�ܿ�ͻᱻ��̭������ʹ��64λ�豸��
  pause
  start https://www.microsoft.com/en-us/download/details.aspx?id=54616
  exit
)
if "%launchupdater%"=="3" (
  pause
  exit
)
