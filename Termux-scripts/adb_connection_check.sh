#!/bin/bash
#by nya

adb get-state > /dev/null 2>&1
EXITSTATUS=$?
if [[ ${EXITSTATUS} != 0 ]]; then
    echo -e "\E[1;31m你没有连接至adb...\E[0m"
    exit 1
fi

echo -e "\E[1;32m检测通过.\E[0m"

for ((i=2;i<=4;i++));do
    echo -e "\E[1;34m$(seq -s '.' ${i} | sed 's/[0-9]//g')\E[0m"
    sleep 1
done
echo -e "\E[1;32mdone\E[0m"
