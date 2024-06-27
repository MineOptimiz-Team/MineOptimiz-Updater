#!/bin/bash
modpackdir=./overrides
configdir=$modpackdir/config
updatedir=$configdir/fancymenu/assets/Update
echo "1.最新稳定版"
echo "2.最新测试版"
echo "3.最新测试版(gitee镜像)"
echo "4.最新测试版(ghproxy镜像)"
echo "5.退出"
echo "下载服务器在国外，建议使用霍格沃兹环境下载"
echo "在更新前，请确保系统中存在wget"
echo "更新后会删除并覆盖模组配置，如果您修改过，请注意备份"
read -p "请输入要更新的版本的编号：" updateversion
if [ "$updateversion" = "1" ]; then
    cp $updaterdir/update-stable.sh
    bash ./update-stable.sh
    rm ./update-stable.sh
    echo "正在更新Updater"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -O "$updatedir/update-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -O "$updatedir/update-stable.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -O "$updatedir/update-mirror-gitee-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -O "$updatedir/update-mirror-ghproxy-dev.sh"
elif [ "$updateversion" = "2" ]; then
    cp $updaterdir/update-dev.sh ./update-dev.sh
    bash ./update-dev.sh
    rm ./update-dev.sh
    echo "正在更新Updater"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -O "$updatedir/update-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -O "$updatedir/update-stable.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -O "$updatedir/update-mirror-gitee-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -O "$updatedir/update-mirror-ghproxy-dev.sh"
elif [ "$updateversion" = "3" ]; then
    cp $updatedir/update-mirror-gitee-dev.sh
    bash ./update-mirror-gitee-dev.sh
    rm ./update-mirror-gitee-dev.sh
    echo "正在更新Updater"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -O "$updatedir/update-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -O "$updatedir/update-stable.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -O "$updatedir/update-mirror-gitee-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -O "$updatedir/update-mirror-ghproxy-dev.sh"
elif [ "$updateversion" = "4" ]; then
    cp $updaterdir/update-mirror-ghproxy-dev.sh ./update-mirror-ghproxy-dev.sh
    bash ./update-mirror-ghproxy-dev.sh
    rm ./update-mirror-ghproxy-dev.sh
    echo "正在更新Updater"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -O "$updatedir/update-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -O "$updatedir/update-stable.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -O "$updatedir/update-mirror-gitee-dev.sh"
    wget "https://raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -O "$updatedir/update-mirror-ghproxy-dev.sh"
elif [ "$updateversion" = "5" ] || [ "$updateversion" = "exit" ]; then
    exit
else
    echo "请输入正确的数字！"
    exit 1
fi
