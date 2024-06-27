#!/bin/bash
updaterdir=./config/fancymenu/assets/Update
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
elif [ "$updateversion" = "2" ]; then
    cp $updaterdir/update-dev.sh ./update-dev.sh
    rm ./update-dev.sh
elif [ "$updateversion" = "3" ]; then
    mkdir updaterbackup
    cp $updaterdir/* ./updaterbackup/
    bash ./updaterbackup/update-mirror-gitee-dev.sh
    mv ./updaterbackup/* $updaterdir/
    rmdir ./updaterbackup
elif [ "$updateversion" = "4" ]; then
    cp $updaterdir/update-mirror-ghproxy-dev.sh ./update-mirror-ghproxy-dev.sh
    rm ./update-mirror-ghproxy-dev.sh
elif [ "$updateversion" = "5" ] || [ "$updateversion" = "exit" ]; then
    exit
else
    echo "请输入正确的数字！"
    exit 1
fi
