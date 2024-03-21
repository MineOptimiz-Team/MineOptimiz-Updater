#!/bin/bash
echo "请确保在更新时关闭了Minecraft"
echo "如果在更新时窗口突然退出，则可能是更新失败"
echo "正在下载更新包中..."
wget stabledownloadlink -O Update.zip || exit 1
#此处stabledownloadlink填写一个可以自动更新的稳定版整合包下载直链
echo "正在解压更新包..."
unzip Update.zip
rm Update.zip
mv *.mrpack Update.zip || exit 1
unzip Update.zip -d ./Update || exit 1
echo "正在删除旧的文件..."
rm -rf ./config
rm -rf ./CustomSkinLoader
rm -rf ./mods
rm -rf ./resourcepacks
echo "正在复制新的文件..."
cp -r "./Update/overrides/config" ./ || exit 1
cp -r "./Update/overrides/CustomSkinLoader" ./ || exit 1
cp -r "./Update/overrides/mods" ./ || exit 1
cp -r "./Update/overrides/resourcepacks" ./ || exit 1
echo "正在下载非内置模组"
#这里是下载MineOptimiz中的非内置模组，若要使用它，建议将此段删除
wget https://mirror.ghproxy.com/https://github.com/ImGRUI/Exordium/releases/download/1.0.3-1.20/exordium-fabric-1.0.3-mc1.20.jar -O ./mods/exordium-fabric-1.0.3-mc1.20.jar || exit 1
wget https://mirror.ghproxy.com/https://github.com/tr7zw/3d-Skin-Layers/releases/download/1.6.2/skinlayers3d-fabric-1.6.2-mc1.20.1.jar -O ./mods/skinlayers3d-fabric-1.6.2-mc1.20.1.jar || exit 1
wget https://cdn.modrinth.com/data/Wq5SjeWM/versions/r2jmO7md/fancymenu_fabric_3.1.2_MC_1.20.1.jar -O ./mods/fancymenu_fabric_3.1.2_MC_1.20.1.jar || exit 1
wget https://mirror.ghproxy.com/https://github.com/tr7zw/EntityCulling/releases/download/1.6.2-1.20/entityculling-fabric-1.6.2-mc1.20.jar -O ./mods/entityculling-fabric-1.6.2-mc1.20.jar || exit 1
wget https://cdn.modrinth.com/data/MPCX6s5C/versions/YbSMjtFY/notenoughanimations-fabric-1.7.1-mc1.20.1.jar -O ./mods/notenoughanimations-fabric-1.7.1-mc1.20.1.jar || exit 1
wget https://cdn.modrinth.com/data/rIC2XJV4/versions/MZzBB2Tu/viafabricplus-2.8.7.jar -O ./mods/viafabricplus-2.8.7.jar
wget https://cdn.modrinth.com/data/9eGKb6K1/versions/blva78z9/voicechat-fabric-1.20.1-2.5.9.jar -O ./mods/voicechat-fabric-1.20.1-2.5.9.jar
echo "下载完成"
echo "正在删除缓存..."
rm Update.zip || echo "删除失败！下次更新可能会出问题！"
rm -rf Update || echo "删除失败！下次更新可能会出问题！"
echo "更新完成"
exit
