#!/bin/bash
if [ "$(git)" ]; then
	checkgit=0
else
    checkgit=1
fi
if [ "$checkgit" = "0" ]; then
    echo "已经安装git，无需提醒"
elif [ "$checkgit" = "1" ]; then
    echo "检测到未安装git！请先安装git再运行该程序"
    exit 1
fi
echo "正在克隆镜像仓库..."
echo "请注意！由于需要克隆整个仓库，需要较大的空间(大约860MB左右)容纳临时文件！"
mirrorname=mirrorname1
mirrorowner=owner1
gitwebsite=examplewebsite
mirrorwebsite=https://$gitwebsite/$mirrorname/$mirrorowner
git clone $mirrorwebsite.git
echo "正在切换到“branch”分支以进行复制"
cd "mirror"
git checkout branch
cd ..
echo "正在删除旧版本文件..."
rm -rf ./config
rm -rf ./CustomSkinLoader
find ./mods -type f ! -name "exordium*" ! -name "entityculling*" ! -name "fancymenu*" ! -name "notenoughanimations*" ! -name "viafabricplus*" ! -name "voicechat*" ! -name "skinlayers3d*" ! -name "OptiFine*" -exec rm -f {} +
rm -rf ./resourcepacks
echo "正在复制新的文件..."
cp -r "./mirror/overrides/config" ./ || exit 1
cp -r "./mirror/overrides/CustomSkinLoader" ./ || exit 1
cp -r "./mirror/overrides/mods" ./ || exit 1
cp -r "./mirror/overrides/resourcepacks" ./ || exit 1
echo "复制完成"
echo "正在删除临时文件"
rm -rf "./mirror" || echo "删除失败！下次更新可能会出问题！"
echo "更新完成"
read -p "请按回车键退出" finish
exit