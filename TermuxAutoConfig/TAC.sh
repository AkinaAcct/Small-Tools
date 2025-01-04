#!/usr/bin/bash
#by AtopesSayuri

set -x

# 部分准备
termux-setup-storage
termux-wake-lock
CWD="$(pwd)"
TMPDIR="$(mktemp -d --suffix=_TAC)"
cd ${TMP}

# 字体替换
## 下载Jetbrain Nerdfont
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/downloadJetBrainsMono.tar.xz
## 解压
unzip JBM.zip
## 替换字体
mv JetBrainsMonoNerdFontMono-Bold.ttf ${HOME}/.termux/font.ttf
rm *.ttf

# 复位
termux-wake-unlock
cd ${CWD}
rm -rf ${TMPDIR}
