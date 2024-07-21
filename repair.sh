#!/bin/bash
echo "正在修复整合包"
mkdir -p ./config/fancymenu/assets/Update/
modpackdir=./
modsdir=$modpackdir/mods
configdir=$modpackdir/config
updatedir=$configdir/fancymenu/assets/Update
rm ./Update.bat
rm ./Update.sh
rm ./Update.ps1
rm $updatedir/*
rm $modsdir/fancymenu*.jar
rm $modsdir/entityculling*.jar
rm $modsdir/skinlayers3d*.jar
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-stable.sh" -O "$updatedir/update-mirror-ghproxy-stable.sh"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/Update.bat" -O "$modpackdir/Update.bat"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/Update.sh" -O "$modpackdir/Update.sh"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -O "$updatedir/update-dev.sh"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -O "$updatedir/update-stable.sh"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -O "$updatedir/update-mirror-gitee-dev.sh"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -O "$updatedir/update-mirror-ghproxy-dev.sh"
mkdir -p $updatedir/7z
mkdir -p $updatedir/aria2
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/7z/7z.dll" -O "$updatedir/7z/7z.dll"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/7z/7z.exe" -O "$updatedir/7z/7z.exe"
wget "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/aria2/aria2c.exe" -O "$updatedir/aria2/aria2c.exe"
sed -i "s~%stabledownloadlink%~https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Stable~g" $modpackdir/Update.bat
sed -i "s~%devdownloadlink%~https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Dev~g" $modpackdir/Update.bat
sed -i "s~ghproxymirror~https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Dev.zip~g" $modpackdir/Update.bat
sed -i "s~ghproxymirror-stable~https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Stable.zip~g" $modpackdir/Update.bat
sed -i "s~branch~1.20.1-Forge-Dev~g" $modpackdir/Update.bat
sed -i "s~branch-stable~1.20.1-Forge-Stable~g" $modpackdir/Update.bat
sed -i "s~devdownloadlink~https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Dev~g" $updatedir/update-dev.sh
sed -i "s~stabledownloadlink~https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Stable~g" $updatedir/update-stable.sh
sed -i "s~mirrorname1~mirror_of_mineoptimiz~g" $updatedir/update-mirror-gitee-dev.sh
sed -i "s~owner1~jxk370~g" $updatedir/update-mirror-gitee-dev.sh
sed -i "s~examplewebsite~gitee.com~g" $updatedir/update-mirror-gitee-dev.sh
sed -i "s~branch~1.20.1-Forge-Dev~g" $updatedir/update-mirror-gitee-dev.sh
sed -i "s~branch~1.20.1-Forge-Dev~g" $updatedir/update-mirror-ghproxy-dev.sh
sed -i "s~ghproxymirror~https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Dev.zip~g" $updatedir/update-mirror-ghproxy-dev.sh
sed -i "s~ghproxymirror-stable~https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Stable.zip~g" $updatedir/update-mirror-ghproxy-stable.sh
sed -i "s~branch~1.20.1-Forge-Stable~g" $updatedir/update-mirror-ghproxy-stable.sh
wget https://cdn.modrinth.com/data/i9oIemgf/versions/pfk4Tavr/fmsia_forge_1.0.1_MC_1.20.1.jar -O ./mods/fmsia_forge_1.0.1_MC_1.20.1.jar
wget https://cdn.modrinth.com/data/o6qsdrrQ/versions/EDf05717/zume-1.0.0.jar -O ./mods/zume-1.0.0.jar
wget https://cdn.modrinth.com/data/NNAgCjsB/versions/DHBIGCNn/entityculling-forge-1.6.6-mc1.20.1.jar -O ./mods/entityculling-forge-1.6.6-mc1.20.1.jar
wget https://cdn.modrinth.com/data/zV5r3pPn/versions/qgzIF2oI/skinlayers3d-forge-1.6.6-mc1.20.1.jar -O ./mods/skinlayers3d-forge-1.6.6-mc1.20.1.jar
wget https://cdn.modrinth.com/data/Wq5SjeWM/versions/P4AHpQ6f/fancymenu_forge_3.2.3_MC_1.20.1.jar -O ./mods/fancymenu_forge_3.2.3_MC_1.20.1.jar 
wget https://cdn.modrinth.com/data/rR4tY6Cw/versions/aJZp3Aoe/modpack-update-checker-1.20.1-forge-0.12.2.jar -O ./mods/modpack-update-checker-1.20.1-forge-0.12.2.jar
echo "修复完成"
read -p "请按回车键退出" finish
exit


