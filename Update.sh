#!/bin/bash
echo "1.最新稳定版"
echo "2.最新测试版"
echo "3.最新测试版(gitee镜像)"
echo "4.退出"
echo "下载服务器在国外，建议使用霍格沃兹环境下载"
echo "在更新前，请确保系统中存在wget"
echo "更新后会删除并覆盖模组配置，如果您修改过，请注意备份"
read -p "请输入要更新的版本的编号：" updateversion
if [ "$updateversion" = "1" ]; then
    bash ./config/fancymenu/assets/Update/update-stable.sh
elif [ "$updateversion" = "2" ]; then
    bash ./config/fancymenu/assets/Update/update-dev.sh
elif [ "$updateversion" = "3" ]; then
    bash ./config/fancymenu/assets/Update/update-mirror-dev.sh
fi
