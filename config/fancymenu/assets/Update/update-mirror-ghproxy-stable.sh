#!/bin/bash
echo "请确保在更新时关闭了Minecraft"
echo "如果在更新时窗口突然退出，则可能是更新失败"
echo "正在下载更新包中..."
wget ghproxymirror-stable -O Update.zip || exit 1
echo "正在解压更新包..."
unzip Update.zip
mv MineOptimiz-3rd-branch Update
echo "正在删除旧的文件..."
rm -rf ./config
rm -rf ./CustomSkinLoader
find ./mods -type f ! -name "exordium*" ! -name "entityculling*" ! -name "fancymenu*" ! -name "notenoughanimations*" ! -name "viafabricplus*" ! -name "voicechat*" ! -name "skinlayers3d*" ! -name "OptiFine*" ! -name "modpack-update-checker*" ! -name "zume*" ! -name "fmsia*" -exec rm -f {} +
read -p "是否删除资源包文件夹？如果您有下载了自己的资源包，请选N，如果没有请选Y :  " removeresourcepacks
if [ "$removeresourcepacks" = "y" ] || [ "$removeresourcepacks" = "yes" ]; then
    rm -rf ./resourcepacks
elif [ "$removeresourcepacks" = "n" ] || [ "$removeresourcepacks" = "no" ]; then
    echo "将不会重置资源包文件夹"
else
    echo "请输入正确的选项！"
    echo "将不会重置资源包文件夹"
fi
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
