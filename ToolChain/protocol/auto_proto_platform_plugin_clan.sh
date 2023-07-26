#!/bin/bash

if [ ! -n "$1" ] ;then
echo "--- ❌ 分支名没有输入，需要重传 ----"
echo "示例: auto_proto_platform.sh develop"
exit
else
echo "--- 分支名为: ${Branch}  ----"
fi

env=0
if [ ! -n "$2" ] ;then
	env=0
else
    if [ $2 == "-rel" ]; then
    	env=1
    fi
fi

Branch=$1

#仓库地址
RepoPath=ssh://git@git.2tianxin.com:2022/mizhua/protocol.git
#输出工程的oc文件路径
GEN_DIR=../../huhuAudio/protoOC

#1. clone proto 仓库,并做清理
rm -rf protoRepo
git clone $RepoPath protoRepo

#2. checkout 需要的分支
cd  protoRepo
git checkout -b ${Branch} origin/${Branch}
cd  ../

#3. 移动需要的文件
echo "移动 clan_pb 文件"
mkdir clan_pb
#记得确定一下仓库存放clan_pb文件路径
mv  ./protoRepo/src/main/proto/clan_pb/* ./clan_pb
echo "移动完成"

#4. 移除keywords
echo "移除keywords"
if [ $env -eq 1 ]
then
	echo "Release Mode"
	python cleanPb.py Release
else
	echo "Debug Mode"
	python cleanPb.py
fi
echo "移除keywords完成"

#5. 转成 OC 文件输出

echo "开始输出OC文件: ${GEN_DIR}"

#platform
rm -rf GEN_DIR/clan_pb
for file in `ls ./clan_pb`
do
#.ext.proto
if [[ `echo $file | awk -F'.' '$0~/.*ext.*proto/{print $3}'` = "proto" ]]
then
echo "name: ${file} ${GEN_DIR}/clan_pb"
./protoc --objc_out=${GEN_DIR} \
clan_pb/$file
fi
done

echo "输出完成"

#清理Repo
rm -rf protoRepo
rm -rf ./clan_pb
