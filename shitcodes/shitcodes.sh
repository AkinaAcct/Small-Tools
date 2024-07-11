#!/usr/bin/env bash
#by nya
#警告！ 不要运行以下的代码！

echo "该代码不允许运行！仅供查看！"
sleep 1145141919810

# 1. 奇妙的变量命名

LAGE=100
AGE=90
if [[ $AGE -lt $LAGE ]]; then
    echo "你超过了你应活的年龄！" #我自己都迷糊
else
    echo "你没有超过了你应活的年龄！" #同上
fi

# 2. 奇妙的缩进
#诶，就是形成一个直角，诶就是玩
if (! command -v pacman >/dev/null 2>&1); then
    if (! command -v apt >/dev/null 2>&1); then
        if (! command -v dnf >/dev/null 2>&1); then
            if (! command -v yum >/dev/null 2>&1); then
                if (! command -v oapt >/dev/null 2>&1); then
                    if (! command -v apk >/dev/null 2>&1); then #马的这种代码写起来好累qwq
                    else
                        PKGMANAGER=apk
                    fi
                else
                    PKGMANAGER=oapt
                fi
            else
                PKGMANAGER=yum
            fi
        else
            PKGMANAGER=dnf
        fi
    else
        PKGMANAGER=apt
    fi
else
    PKGMANAGER=pacman
fi

# 3. 无法到达的彼岸

CHOICE=1
case $CHOICE in
1) echo "你的选择是：1" && exit ;;
2) echo "你的选择是：2" && exit ;;
*) echo "两个都不选十八？你竟敢这样戏弄本小姐！" && exit 123;
esac
echo "哼，这就是我无法到达的plan b了~~"
