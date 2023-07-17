#!/bin/bash
#by nya
source "./color_echo.sh" #echo颜色变量存储文件
source "./adb_connection_check.sh" #修改以下路径来加载自定义路径下的adb连接脚本(可自定义)

adb shell am startservice -n com.termux.api/.KeepAliveService
EXITSTATUS=$?
if [[ EXITSTATUS != 0 ]]; then
    echo -e "${RED}E${RESET}:启动失败.检查你是否安装了Termux-api."
fi
