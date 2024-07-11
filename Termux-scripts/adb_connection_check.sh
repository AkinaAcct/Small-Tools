#!/bin/bash
#by nya

adb get-state >/dev/null 2>&1
EXITSTATUS=$?
if [[ ${EXITSTATUS} != 0 ]]; then
    echo -e "\E[1;31m你没有连接至adb...\E[0m"
    exit 1
else
    echo -e "\E[1;32m检测通过.ADB已连接.\E[0m"
fi
