#!/bin/bash
#by nya

ARGNUM=6

LINES=$(git log  --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "%s", add, subs, loc }' -) #lines of code
STATUS=$(git status -s) #git status -s
if [ -z "${STATUS}" ];then
    STATUS="无文件变更"
fi
OBJSIZE=$(git count-objects -H) #objects' full size
ALLLOCALBRANCH=$(git branch) #git branch
CONTRIBUTORS=$(git log --pretty='%aN' | sort -u) #contributors
LOCALCOMMITS=$(git log --oneline | wc -l) #local commit timez

ALLINFO=("${LINES}" "${STATUS}" "${ALLLOCALBRANCH}" "${OBJSIZE}" "${CONTRIBUTORS}" "${LOCALCOMMITS}") #all info var
ALLINFOTEXT=("lines_of_code" "status" "local_branch" "full_size" "contributors" "local_commit_times") #all info text

for i in $(seq 0 $(($ARGNUM - 1)));do
    echo -e "\e[32m${ALLINFOTEXT[$i]}: \e[0m"
    echo -e "\t"${ALLINFO[$i]}""
done
