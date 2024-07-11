#!/bin/bash
#by nya
source "../color_echo/color_echo.sh" #echo颜色变量存储文件
source "./adb_connection_check.sh"   #修改以下路径来加载自定义路径下的adb连接脚本(可自定义)

start_service() {
    adb shell am startservice -n com.termux.api/.KeepAliveService
    EXITSTATUS=$?
    if [[ ${EXITSTATUS} = 0 ]]; then
        echo -e "${GREEN}I${RESET}:启动成功."
    else
        echo -e "${RED}E${RESET}:启动失败.检查你是否安装了Termux-api."
    fi
}
stop_service() {
    adb shell am stopservice -n com.termux.api/.KeepAliveService
    EXITSTATUS=$?
    if [[ ${EXITSTATUS} = 0 ]]; then
        echo -e "${GREEN}I${RESET}:停止成功."
    else
        echo -e "${RED}E${RESET}:停止失败,或你并未启动Termux-api."
    fi
}
print_help() {
    echo "-s, 启动Termux-api服务."
    echo "-p, 停止Termux-api服务."
    echo "-h, 打印此帮助."
}
while getopts :sph OPT; do
    case ${OPT} in
    s) start_service ;;
    p) stop_service ;;
    h) print_help ;;
    ?) echo -e "${RED}E${RESET}:未知的选项:-${OPT}.使用-h选项来获取帮助." && exit 1 ;;
    *) start_service ;;
    esac
done
