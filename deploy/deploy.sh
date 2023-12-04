#!/bin/bash

# 本地 AMIS 项目路径
local_path="/Users/hb.li/Documents/royce/star-royce/font.admin.demo"

# 远程服务器相关信息
remote_user="root"
remote_host="129.226.220.183"
remote_path="/opt/chocolate/fontend"

# 打包 AMIS 项目并排除 node_modules 目录
cd  "$local_path" || exit
mkdir font-chocolate
cp -r web/* font-chocolate
cd ./font-chocolate || exit
find . -type d -name "node_modules" -exec rm -rf {} +
find . -type d -name ".git" -exec rm -rf {} +
zip -r font-chocolate.zip .

# 上传生成的 zip 文件到远程服务器
scp font-chocolate.zip "$remote_user"@"$remote_host":"$remote_path"

# 清理本地临时文件
# rm -rf font-chocolate