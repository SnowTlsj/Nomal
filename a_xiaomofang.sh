#!/bin/bash
# new Env('BBK-小魔方');
# cron 31 13 * * * a_xiaomofang.sh
# export JD_LOG_XYZ_TOKEN="从机器人获取的token"
# export Proxy_Url="代理网址 例如：星空、熊猫 生成选择txt 一次一个"
# export XIAOMOFANG_DELAY="2" #等待几秒 默认0秒 可选参数,可以不填。
# export XIAOMOFANG_EXCHANGES="1;3;6" #兑换几魔方 默认兑换3魔方 可选参数
# export XIAOMOFANG_PROXY="true" #黑IP自动使用代理 默认不用代理 可选参数,可以不填。
# export XIAOMOFANG_USE_PROXY="true" #强制使用代理 默认不用代理 可选参数,可以不填。
pwd
_ftype=""
use_get_arch=${BBK_ARCH}
if [ $use_get_arch != "" ]; then
  get_arch=$use_get_arch
  echo "指定运行$use_get_arch"
fi
get_arch=`arch`
echo $get_arch
if [[ $get_arch =~ "x86_64" ]];then
	_ftype="linux-amd64"
elif [[ $get_arch =~ "x86" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "i386" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "aarch64" ]];then
	_ftype="linux-arm64"
elif [[ $get_arch =~ "arm" ]];then
	_ftype="linux-arm"
else
	_ftype=""
fi

if [ $_ftype == "" ]; then
	echo "不支持的架构$get_arch"
else
	echo "执行$_ftype"
    if [ -f "$PWD/BBK/$_ftype.bbk" ]; then
        echo "$PWD/BBK/$_ftype.bbk"
        eval "chmod +x ./BBK/$_ftype.bbk"
        eval "./BBK/$_ftype.bbk -t xiaomofang"
    else
        if [ ! -f "$PWD/$_ftype.bbk" ]; then
            echo "在$PWD/BBK目录、$PWD目录下均未找到文件$_ftype.bbk"
            exit 1
        fi
        echo "$PWD/$_ftype.bbk"
        eval "chmod +x $PWD/$_ftype.bbk"
        eval "$PWD/$_ftype.bbk -t xiaomofang"
    fi
fi