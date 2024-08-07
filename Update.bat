@echo off
mklink /j guirequired .\config\fancymenu\assets
echo 欢迎使用MineOptimiz Updater
echo 1.下载并更新至最新稳定版
echo 2.下载并更新至最新测试版
echo 3.通过ghproxy镜像下载并更新至最新稳定版
echo 4.通过ghproxy镜像下载并更新至最新测试版
echo 5.退出
set /p update=
if "%update%"=="5" exit
echo 请确保Minecraft处于关闭状态
echo 正在下载更新包
if "%update%"=="1" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %stabledownloadlink%
rem 此处%stabledownloadlink%填写一个可自动更新的稳定版整合包下载链接
if "%update%"=="2" .\guirequired\Update\aria2\aria2c.exe -o Update.zip %devdownloadlink%
rem 此处%devdownloadlink%填写一个可自动更新的测试版整合包下载链接
if "%update%"=="3" .\guirequired\Update\aria2\aria2c.exe -o Update.zip ghproxymirror-stable
if "%update%"=="4" .\guirequired\Update\aria2\aria2c.exe -o Update.zip ghproxymirror
if errorlevel 1 (
  echo 下载失败！
  pause
  exit /b 1
)
echo 下载完成
echo 正在解压更新包
if not "%update%"=="3" (
  .\guirequired\Update\7z\7z.exe x Update.zip
  del Update.zip
  ren *.mrpack Update.zip
  .\guirequired\Update\7z\7z.exe x Update.zip -o".\Update"
)
if "%update%"=="3" (
  .\guirequired\Update\7z\7z.exe x Update.zip
  ren MineOptimiz-3rd-branch-stable Update
)
if "%update%"=="4" (
  .\guirequired\Update\7z\7z.exe x Update.zip
  ren MineOptimiz-3rd-branch Update
)
if errorlevel 1 (
  echo 解压失败！
  pause
  exit /b 1
)
echo 解压完成
echo 正在删除旧的文件
set "MOD=.\mods"
powershell -Command "Get-ChildItem -Path '%MOD%' -Exclude 'exordium*.jar', 'entityculling*.jar', 'fancymenu*.jar', 'notenoughanimations*.jar', 'viafabricplus*.jar', 'voicechat*.jar', 'skinlayers3d*.jar', 'OptiFine*.jar', 'modpack-update-checker*.jar', 'zume*.jar', 'fmsia*.jar' -Recurse | Remove-Item -Force -Recurse"
rd /s /q config
rd /s /q CustomSkinLoader
rd /s /q mods
echo 是否删除资源包文件夹？如果您有下载了自己的资源包，请选N，如果没有请选Y
set /p removeresourcepacks=
if "%removeresourcepacks%"=="y" rd /s /q resourcepacks
if "%removeresourcepacks%"=="n" echo 将不会重置资源包文件夹
if errorlevel 1 (
  echo 删除失败！
  pause
  exit /b 1
)
echo 删除完成
echo 正在复制新的文件
xcopy .\Update\overrides\config .\config /E /H /I
xcopy .\Update\overrides\CustomSkinLoader .\CustomSkinLoader /E /H /I
xcopy .\Update\overrides\mods .\mods /E /H /I
xcopy .\Update\overrides\resourcepacks .\resourcepacks /E /H /I
if errorlevel 1 (
  echo 复制失败！
  pause
  exit /b 1
)
echo 复制完成！
echo 正在删除缓存
rd /s /q guirequired
rd /s /q Update
del Update.zip
if errorlevel 1 (
  echo 删除失败！
  echo 下次更新可能会出问题
)
echo 更新完成！
echo 请重启Minecraft以查看更改
pause
