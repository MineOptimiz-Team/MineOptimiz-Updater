@echo off
mklink /j guirequired .\config\fancymenu\assets
echo ��ӭʹ��MineOptimiz Updater
echo 1.���ز������������ȶ���
echo 2.���ز����������²��԰�
echo 3.ͨ��ghproxy�������ز������������ȶ���
echo 4.ͨ��ghproxy�������ز����������²��԰�
echo 5.�˳�
set /p update=
if "%update%"=="5" exit
echo ��ȷ��Minecraft���ڹر�״̬
echo �������ظ��°�
if "%update%"=="1" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %stabledownloadlink%
rem �˴�%stabledownloadlink%��дһ�����Զ����µ��ȶ������ϰ���������
if "%update%"=="2" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %devdownloadlink%
rem �˴�%devdownloadlink%��дһ�����Զ����µĲ��԰����ϰ���������
if "%update%"=="3" .\guirequired\Update\aria2\aria2c.exe -o Update.zip ghproxymirror-stable
if "%update%"=="4" .\guirequired\Update\aria2\aria2c.exe -o Update.zip ghproxymirror
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo �������
echo ���ڽ�ѹ���°�
if not "%update%"=="3" (
  .\guirequired\Update\7z\7z.exe x Update.zip
  del Update.zip
  ren *.mrpack Update.zip
  .\guirequired\Update\7z\7z.exe x Update.zip -o".\Update"
)
if "%update%"=="3" (
  .\guirequired\Update\7z\7z.exe x Update.zip
  ren MineOptimiz-3rd-branch Update
)
if errorlevel 1 (
  echo ��ѹʧ�ܣ�
  pause
  exit /b 1
)
echo ��ѹ���
echo ����ɾ���ɵ��ļ�
set "MOD=.\mods"
powershell -Command "Get-ChildItem -Path '%MOD%' -Exclude 'exordium*.jar', 'entityculling*.jar', 'fancymenu*.jar', 'notenoughanimations*.jar', 'viafabricplus*.jar', 'voicechat*.jar', 'skinlayers3d*.jar', 'OptiFine*.jar', 'modpack-update-checker*.jar', 'zume*.jar', 'fmsia*.jar' -Recurse | Remove-Item -Force -Recurse"
rd /s /q config
rd /s /q CustomSkinLoader
rd /s /q mods
echo �Ƿ�ɾ����Դ���ļ��У���������������Լ�����Դ������ѡN�����û����ѡY
set /p removeresourcepacks=
if "%removeresourcepacks%"=="y" rd /s /q resourcepacks
if "%removeresourcepacks%"=="n" echo ������������Դ���ļ���
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
