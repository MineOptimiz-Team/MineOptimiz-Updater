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
.\guirequired\Update\aria2\aria2c.exe -o .\mods\exordium-fabric-1.0.3-mc1.20.jar https://mirror.ghproxy.com/https://github.com/ImGRUI/Exordium/releases/download/1.0.3-1.20/exordium-fabric-1.0.3-mc1.20.jar
.\guirequired\Update\aria2\aria2c.exe -o .\mods\skinlayers3d-fabric-1.6.2-mc1.20.1.jar https://mirror.ghproxy.com/https://github.com/tr7zw/3d-Skin-Layers/releases/download/1.6.2/skinlayers3d-fabric-1.6.2-mc1.20.1.jar
.\guirequired\Update\aria2\aria2c.exe -o .\mods\fancymenu_fabric_3.1.2_MC_1.20.1.jar https://cdn.modrinth.com/data/Wq5SjeWM/versions/r2jmO7md/fancymenu_fabric_3.1.2_MC_1.20.1.jar
.\guirequired\Update\aria2\aria2c.exe -o .\mods\entityculling-fabric-1.6.2-mc1.20.jar https://mirror.ghproxy.com/https://github.com/tr7zw/EntityCulling/releases/download/1.6.2-1.20/entityculling-fabric-1.6.2-mc1.20.jar
.\guirequired\Update\aria2\aria2c.exe -o .\mods\notenoughanimations-fabric-1.7.1-mc1.20.1.jar https://cdn.modrinth.com/data/MPCX6s5C/versions/YbSMjtFY/notenoughanimations-fabric-1.7.1-mc1.20.1.jar
.\guirequired\Update\aria2\aria2c.exe -o .\config\fancymenu\assets\Update\update-dev.sh https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/MineOptimiz-Updater/releases/download/v1.0.1/update-1.20.1-dev.sh
.\guirequired\Update\aria2\aria2c.exe -o .\config\fancymenu\assets\Update\update-stable.sh https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/MineOptimiz-Updater/releases/download/v1.0.1/update-1.20.1-stable.sh
.\guirequired\Update\aria2\aria2c.exe -o .\mods\viafabricplus-2.8.7.jar https://cdn.modrinth.com/data/rIC2XJV4/versions/MZzBB2Tu/viafabricplus-2.8.7.jar
.\guirequired\Update\aria2\aria2c.exe -o .\mods\voicechat-fabric-1.20.1-2.5.9.jar https://cdn.modrinth.com/data/9eGKb6K1/versions/blva78z9/voicechat-fabric-1.20.1-2.5.9.jar
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
