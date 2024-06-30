#!/bin/bash
echo "请确保在更新时关闭了Minecraft"
echo "如果在更新时窗口突然退出，则可能是更新失败"
echo "正在下载更新包中..."
wget devdownloadlink -O Update.zip || exit 1
#此处devdownloadlink填写一个可以自动更新的测试版整合包下载直链
echo "正在解压更新包..."
unzip Update.zip
rm Update.zip
mv *.mrpack Update.zip || exit 1
unzip Update.zip -d ./Update || exit 1
echo "正在删除旧的文件..."
rm -rf ./config
rm -rf ./CustomSkinLoader
find ./mods -type f ! -name "exordium*" ! -name "entityculling*" ! -name "fancymenu*" ! -name "notenoughanimations*" ! -name "viafabricplus*" ! -name "voicechat*" ! -name "skinlayers3d*" ! -name "OptiFine*" ! -name "modpack-update-checker*" ! -name "zume*" ! -name "fmsia*" -exec rm -f {} +
rm -rf ./resourcepacks
echo "正在复制新的文件..."
cp -r "./Update/overrides/config" ./ || exit 1
cp -r "./Update/overrides/CustomSkinLoader" ./ || exit 1
cp -r "./Update/overrides/mods" ./ || exit 1
cp -r "./Update/overrides/resourcepacks" ./ || exit 1
echo "复制完成"
echo "正在删除缓存..."
rm Update.zip || echo "删除失败！下次更新可能会出问题！"
rm -rf Update || echo "删除失败！下次更新可能会出问题！"
echo "更新完成"
read -p "请按回车键退出" finish
exit
