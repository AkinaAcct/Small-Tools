#!/bin/bash
#by nya

echo -e "现在是:$(date +"%Y-%m-%d %H:%M:%S")."
echo -e "登录用户:$(whoami)."
echo -e "当前shell:${SHELL}\n"

echo -e "当前发行版:$(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME=//' | sed 's/"//' | sed 's/"//')"
echo -e "当前Linux内核版本:$(uname -r)"
echo -e "CPU型号:$(cat /proc/cpuinfo | grep Hardware | awk '{print $3}')"
echo -e "总内存:$(($(cat /proc/meminfo | grep MemTotal | awk '{print $2}') / 1024))MiB"
echo -e "已使用:$(($(cat /proc/meminfo | grep MemAvailable | awk '{print $2}') / 1024))MiB\n"

echo -e "欢迎您的登录！"

#记录登录数据

echo -e "登录账号:$(whoami)\t时间:$(date +"%Y-%m-%d %H:%M:%S")" >>${HOME}/.login.history
