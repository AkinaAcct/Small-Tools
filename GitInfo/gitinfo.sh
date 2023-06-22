#!/bin/bash
#by nya
function get_info(){
    LINES=$(git log  --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "%s", add, subs, loc }' -) #lines of code
    STATUS=$(git status -s) #git status -s
    if [[ -z ${STATUS} ]];then
        STATUS="无文件变更"
    fi
    OBJSIZE=$(git count-objects -H) #objects' full size
    ALLLOCALBRANCH=$(git branch) #git branch
    CONTRIBUTORS=$(git log --pretty='%aN' | sort -u) #contributors
    LOCALCOMMITS=$(git log --oneline | wc -l) #local commit timez

    ALLINFO=("${LINES}" "${STATUS}" "${ALLLOCALBRANCH}" "${OBJSIZE}" "${CONTRIBUTORS}" "${LOCALCOMMITS}") #all info var
    ALLINFOTEXT=("lines_of_code" "status" "local_branch" "full_size" "contributors" "local_commit_times") #all info text
}
function print_info(){
    local PWD=$(pwd)
    if [ -n "$GITPATH" ];then
        cd $GITPATH
    fi
    get_info
    for i in 0 1 2 3 4 5;do
        echo -e "\e[32m${ALLINFOTEXT[$i]}: \e[0m"
        echo -e "${ALLINFO[$i]}"
    done
    cd ${PWD}
    exit 0
}
function print_help() {
    echo "-h show this help."
    echo "-d path/to/repositories/root, show info of a repositories.Add path if you want to specify the repositories."
    echo "Have a good time!"
}

if [ "$*" == "" ];then
    print_info
fi
while getopts ":hd:" ARGS;do
    case ${ARGS} in
        h) print_help && exit 0;;
        d) GITPATH=$OPTARG && print_info;;
        :) echo "选择-$OPTARG后需要一个参数" && exit 1;;
        ?) echo "错误的选项:-$OPTARG" && print_help && exit 1;;
    esac
done
