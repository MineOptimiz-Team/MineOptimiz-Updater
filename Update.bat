@echo off
mklink /j guirequired .\config\fancymenu\assets
echo ��ӭʹ��MineOptimiz Updater
echo 1.���ز������ȶ���
echo 2.���ز����²��԰�
echo 3.�˳�
set /p update=
if "%update%"=="3" exit
echo ��ȷ��Minecraft���ڹر�״̬
echo �������ظ��°�
if "%update%"=="1" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %stabledownloadlink%
rem �˴�%stabledownloadlink%��дһ�����Զ����µ��ȶ������ϰ���������
if "%update%"=="2" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %devdownloadlink%
rem �˴�%devdownloadlink%��дһ�����Զ����µĲ��԰����ϰ���������
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo �������
echo ���ڽ�ѹ���°�
.\guirequired\Update\7z\7z.exe x Update.zip
del Update.zip
ren *.mrpack Update.zip
.\guirequired\Update\7z\7z.exe x Update.zip -o".\Update"
if errorlevel 1 (
  echo ��ѹʧ�ܣ�
  pause
  exit /b 1
)
echo ��ѹ���
echo ����ɾ���ɵ��ļ�
set "MOD=.\mods"
powershell -Command "Get-ChildItem -Path '%MOD%' -Exclude 'exordium*.jar', 'entityculling*.jar', 'fancymenu*.jar', 'notenoughanimations*.jar', 'viafabricplus*.jar', 'voicechat*.jar', 'skinlayers3d*.jar' -Recurse | Remove-Item -Force -Recurse"
rd /s /q config
rd /s /q CustomSkinLoader
rd /s /q mods
rd /s /q resourcepacks
if errorlevel 1 (
  echo ɾ��ʧ�ܣ�
  pause
  exit /b 1
)
echo ɾ�����
echo ���ڸ����µ��ļ�
xcopy .\Update\overrides\config .\config /E /H /I
xcopy .\Update\overrides\CustomSkinLoader .\CustomSkinLoader /E /H /I
xcopy .\Update\overrides\mods .\mods /E /H /I
xcopy .\Update\overrides\resourcepacks .\resourcepacks /E /H /I
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo ������ɣ�
echo �������ط��������
.\guirequired\Update\aria2\aria2c.exe -o .\config\fancymenu\assets\Update\update-dev.sh https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/MineOptimiz-Updater/releases/download/v1.0.4/update-dev.sh
.\guirequired\Update\aria2\aria2c.exe -o .\config\fancymenu\assets\Update\update-stable.sh https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/MineOptimiz-Updater/releases/download/v1.0.4/update-stable.sh
rem ��һ������������һ��Updater���������޸�ʱɾ��
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo �������
echo ����ɾ������
rd /s /q guirequired
rd /s /q Update
del Update.zip
if errorlevel 1 (
  echo ɾ��ʧ�ܣ�
  echo �´θ��¿��ܻ������
)
echo ������ɣ�
echo ������Minecraft�Բ鿴����
pause
