#!/bin/bash
#by nya

LINES=$()$(git ls-files | xargs wc -l | tail -n1 | awk '{print $1}') #lines of code
STATUS=$(git status -s) #git status -s
if [ -z "${STATUS}" ];then
    STATUS="无文件变更"
fi
OBJSIZE=$(git count-objects -H) #objects' full size
ALLLOCALBRANCH=$(git branch) #git branch
ALLREMOTEBRANCH=$(git branch -r) #git branch -r

ALLINFO=('${LINES}' '${STATUS}' '${ALLLOCALBRANCH}' '${ALLREMOTEBRANCH}' '${OBJSIZE}') #all info

for i in "${ALLINFO[@]}";do
    echo "$i"
done
