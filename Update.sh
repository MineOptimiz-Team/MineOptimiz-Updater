#!/bin/bash
updatedir=./config/fancymenu/assets/Update
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
    mkdir updaterbackup
    cp -r $updatedir/* ./updaterbackup
    bash $updatedir/update-stable.sh
    mkdir -p $updatedir
    mv ./updaterbackup/* $updatedir/
    rmdir ./updaterbackup
elif [ "$updateversion" = "2" ]; then
    mkdir updaterbackup
    cp -r $updatedir/* ./updaterbackup
    bash $updatedir/update-dev.sh
    mkdir -p $updatedir
    mv ./updaterbackup/* $updatedir/
    rmdir ./updaterbackup
elif [ "$updateversion" = "3" ]; then
    mkdir updaterbackup
    cp -r $updatedir/* ./updaterbackup
    bash $updatedir/update-mirror-gitee-dev.sh
    mkdir -p $updatedir
    mv ./updaterbackup/* $updatedir/
    rmdir ./updaterbackup
elif [ "$updateversion" = "4" ]; then
    mkdir updaterbackup
    cp -r $updatedir/* ./updaterbackup
    bash $updatedir/update-mirror-ghproxy-dev.sh
    mkdir -p $updatedir
    mv ./updaterbackup/* $updatedir/
    rmdir ./updaterbackup
elif [ "$updateversion" = "5" ] || [ "$updateversion" = "exit" ]; then
    exit
else
    echo "请输入正确的数字！"
    exit 1
fi