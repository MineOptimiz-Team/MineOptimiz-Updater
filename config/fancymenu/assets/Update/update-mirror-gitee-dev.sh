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
mirrorwebsite=https://$gitwebsite/$mirrorowner/$mirrorname
git clone $mirrorwebsite.git
echo "正在切换到“branch”分支以进行复制"
cd $mirrorname
git checkout branch
cd ..
echo "正在删除旧版本文件..."
rm -rf ./config
rm -rf ./CustomSkinLoader
find ./mods -type f ! -name "exordium*" ! -name "entityculling*" ! -name "fancymenu*" ! -name "notenoughanimations*" ! -name "viafabricplus*" ! -name "voicechat*" ! -name "skinlayers3d*" ! -name "OptiFine*" ! -name "modpack-update-checker*" ! -name "zume*" ! -name "fmsia*" -exec rm -f {} +
read -p "是否删除资源包文件夹？如果您有下载了自己的资源包，请选N，如果没有请选Y :  " removeresourcepacks
if [ "$removeresourcepacks" = "y" ] || [ "$removeresourcepacks" = "yes" ]; then
    rm -rf ./resourcepacks
elif [ "$removeresourcepacks" = "n" ] || [ "$removeresourcepacks" = "no" ];then
    echo "将不会重置资源包文件夹"
else
    echo "请输入正确的选项！"
    echo "将不会重置资源包文件夹"
fi
echo "正在复制新的文件..."
cp -r "./$mirrorname/overrides/config" ./ || exit 1
cp -r "./$mirrorname/overrides/CustomSkinLoader" ./ || exit 1
cp -r "./$mirrorname/overrides/mods" ./ || exit 1
cp -r "./$mirrorname/overrides/resourcepacks" ./ || exit 1
echo "复制完成"
echo "正在删除临时文件"
rm -rf "./$mirrorname" || echo "删除失败！下次更新可能会出问题！"
echo "更新完成"
read -p "请按回车键退出" finish
exit