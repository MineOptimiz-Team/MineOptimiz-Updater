# PowerShell 脚本开始
Write-Host "正在修复整合包"

# 定义变量
$modsdir = ".\mods"
$configdir = ".\config"
$updatedir = "$configdir\fancymenu\assets\Update"

# 删除文件
Remove-Item -Path "./Update.bat", "./Update.sh", "./Update.ps1" -Force
Remove-Item -Path "$updatedir/*" -Recurse -Force
Remove-Item -Path "$modsdir/fancymenu*.jar", "$modsdir/entityculling*.jar", "$modsdir/skinlayers3d*.jar" -Force

# 下载文件
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/Update.bat" -OutFile ".\Update.bat"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/Update.sh" -OutFile ".\Update.sh"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-dev.sh" -OutFile "$updatedir\update-dev.sh"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-stable.sh" -OutFile "$updatedir\update-stable.sh"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-gitee-dev.sh" -OutFile "$updatedir\update-mirror-gitee-dev.sh"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-dev.sh" -OutFile "$updatedir\update-mirror-ghproxy-dev.sh"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/update-mirror-ghproxy-stable.sh" -OutFile "$updatedir\update-mirror-ghproxy-stable.sh"

# 创建7z和aria2目录
if (-Not (Test-Path "$updatedir\7z")) {
    New-Item -ItemType Directory -Force -Path "$updatedir\7z"
}
if (-Not (Test-Path "$updatedir\aria2")) {
    New-Item -ItemType Directory -Force -Path "$updatedir\aria2"
}

# 下载7z和aria2文件
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/7z/7z.dll" -OutFile "$updatedir\7z\7z.dll"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/7z/7z.exe" -OutFile "$updatedir\7z\7z.exe"
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/raw.githubusercontent.com/MineOptimiz-Team/MineOptimiz-Updater/master/config/fancymenu/assets/Update/aria2/aria2c.exe" -OutFile "$updatedir\aria2\aria2c.exe"

# 下载mod文件
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/i9oIemgf/versions/pfk4Tavr/fmsia_forge_1.0.1_MC_1.20.1.jar" -OutFile "$modsdir\fmsia_forge_1.0.1_MC_1.20.1.jar"
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/o6qsdrrQ/versions/EDf05717/zume-1.0.0.jar" -OutFile "$modsdir\zume-1.0.0.jar"
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/NNAgCjsB/versions/DHBIGCNn/entityculling-forge-1.6.6-mc1.20.1.jar" -OutFile "$modsdir\entityculling-forge-1.6.6-mc1.20.1.jar"
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/zV5r3pPn/versions/qgzIF2oI/skinlayers3d-forge-1.6.6-mc1.20.1.jar" -OutFile "$modsdir\skinlayers3d-forge-1.6.6-mc1.20.1.jar"
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/Wq5SjeWM/versions/P4AHpQ6f/fancymenu_forge_3.2.3_MC_1.20.1.jar" -OutFile "$modsdir\fancymenu_forge_3.2.3_MC_1.20.1.jar"
Invoke-WebRequest -Uri "https://cdn.modrinth.com/data/rR4tY6Cw/versions/aJZp3Aoe/modpack-update-checker-1.20.1-forge-0.12.2.jar" -OutFile "$modsdir\modpack-update-checker-1.20.1-forge-0.12.2.jar"
# 替换字符串
(Get-Content ".\Update.bat") -replace '%stabledownloadlink%', 'https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge' | Set-Content ".\Update.bat"
(Get-Content ".\Update.bat") -replace '%devdownloadlink%', 'https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Dev' | Set-Content ".\Update.bat"
(Get-Content ".\Update.bat") -replace 'ghproxymirror', 'https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Dev.zip' | Set-Content ".\Update.bat"
(Get-Content ".\Update.bat") -replace 'branch', '1.20.1-Forge-Dev' | Set-Content ".\Update.bat"
(Get-Content ".\Update.bat") -replace 'ghproxymirror-stable', 'https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Stable.zip' | Set-Content ".\Update.bat"
(Get-Content ".\Update.bat") -replace 'branch-stable', '1.20.1-Forge-Stable' | Set-Content ".\Update.bat"
(Get-Content "$updatedir\update-dev.sh") -replace 'devdownloadlink', 'https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge-Dev' | Set-Content "$updatedir\update-dev.sh"
(Get-Content "$updatedir\update-stable.sh") -replace 'stabledownloadlink', 'https://nightly.link/MineOptimiz-Team/MineOptimiz-3rd/workflows/main/1.20.1-Forge' | Set-Content "$updatedir\update-stable.sh"
(Get-Content "$updatedir\update-mirror-gitee-dev.sh") -replace 'mirrorname1', 'mirror_of_mineoptimiz' | Set-Content "$updatedir\update-mirror-gitee-dev.sh"
(Get-Content "$updatedir\update-mirror-gitee-dev.sh") -replace 'owner1', 'jxk370' | Set-Content "$updatedir\update-mirror-gitee-dev.sh"
(Get-Content "$updatedir\update-mirror-gitee-dev.sh") -replace 'examplewebsite', 'gitee.com' | Set-Content "$updatedir\update-mirror-gitee-dev.sh"
(Get-Content "$updatedir\update-mirror-gitee-dev.sh") -replace 'branch', '1.20.1-Forge-Dev' | Set-Content "$updatedir\update-mirror-gitee-dev.sh"
(Get-Content "$updatedir\update-mirror-ghproxy-dev.sh") -replace 'branch', '1.20.1-Forge-Dev' | Set-Content "$updatedir\update-mirror-ghproxy-dev.sh"
(Get-Content "$updatedir\update-mirror-ghproxy-dev.sh") -replace 'ghproxymirror', 'https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Dev.zip' | Set-Content "$updatedir\update-mirror-ghproxy-dev.sh"
(Get-Content "$updatedir\update-mirror-ghproxy-dev.sh") -replace 'branch', '1.20.1-Forge-stable' | Set-Content "$updatedir\update-mirror-ghproxy-stable.sh"
(Get-Content "$updatedir\update-mirror-ghproxy-dev.sh") -replace 'ghproxymirror-stable', 'https://mirror.ghproxy.com/https://github.com/MineOptimiz-Team/MineOptimiz-3rd/archive/refs/heads/1.20.1-Forge-Stable.zip' | Set-Content "$updatedir\update-mirror-ghproxy-stable.sh"

Write-Host "修复完成"