#!/bin/bash
#by nya
source "../color_echo/color_echo.sh"

print_help() {
    echo -e "-i,\t指定音乐ID(必填).获取方法请自行搜索."
    echo -e "-p,\t指定保存路径(选填).默认为\"./music.mp3\""
    echo -e "-d,\t指定下载器(选填)."
    echo -e "-h,\t打印此帮助."
}
start_download() {
    if [[ -z ${MUSICID} ]]; then
        echo -e "${RED}E${RESET}:参数不足.使用-h选项获取帮助."
        exit 1
    fi
    if [[ -z ${DOWNLOADPATH} ]]; then
        DOWNLOADPATH="music.mp3"
        echo -e "${BLUE}I${RESET}:未设置保存路径.使用${DOWNLOADPATH}."
    fi
    if [[ -z ${DLPROVIDER} ]]; then
        DLPROVIDER=aria2c
        echo -e "${BLUE}I${RESET}:未指定下载器,使用${DLPROVIDER}进行下载."
    fi
    ${DLPROVIDER} "http://music.163.com/song/media/outer/url?id=${MUSICID}.mp3" -o "${DOWNLOADPATH}"
    echo -e "${BLUE}I${RESET}:完成."
}

while getopts :i:p:d:h OPT; do
    case ${OPT} in
    i) MUSICID="${OPTARG}" ;;
    p) DOWNLOADPATH="${OPTARG}" ;;
    d) DLPROVIDER="${OPTARG}" ;;
    h) print_help && exit 0 ;;
    :) echo -e "${RED}E${RESET}:选项-${OPT}需要一个参数." && exit 1 ;;
    ?) echo -e "${RED}E${RESET}:未知的选项:-${OPT}." && exit 1 ;;
    esac
done
start_download
