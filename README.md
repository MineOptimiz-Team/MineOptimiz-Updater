## MineOptimiz Updater
## 这是什么？
[MineOptimiz](https://github.com/SmallMushroom-offical/MineOptimiz-Next)的附加项目，用于下载和更新整合包，使用Shell脚本和Windows批处理文件编写
## 我可以在自己的整合包使用它吗？
当然，但不是最好的办法，不建议使用
## 如何使用它？
 - 首先修改脚本中指向的目录结构，在Windows版中这很容易修改
 - 然后修改脚本指向的下载链接，最好是一个能自动更新的下载直链
 - 请注意：我没法保证这会在其他的整合包中工作，因为这在MineOptimiz中也无法保证:(
## License
 - MineOptimiz Updater使用[LGPL2.1](https://github.com/SmallMushroom-offical/MineOptimiz-Updater/blob/main/LICENSE)许可证
 - 除此之外，我建议你在自己的整合包中修改它的名字，或者不取名字
## 使用的软件包
 - wget : 用于在Linux中下载更新包（现在的Linux发行版中一般都有wget，如果没有，请先安装）
 - 7-zip : 用于在Windows中更便捷地解压更新包
 - aria2 : 用于在Windows中更便捷地下载更新包
