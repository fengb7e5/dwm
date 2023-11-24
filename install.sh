#!/bin/bash


CACHE_DIR=$HOME"/.cache/walter-dwm"

if ![ -d "$CACHE_DIR" ]; then
    mkdir $CACHE_DIR
fi

title() {
    echo -e "\033[32m----------"$*"----------\033[0m"
}

subtitle() {
    echo -e "\033[32m-----"$*"\033[0m"
}

title "安装字体"

 pacman -S ttf-cascadia-code-nerd ttf-jetbrains-mono-nerd ttf-iosevka-nerd wqy-zenhei wqy-microhei
pacman -S nerd-fonts-complete ttf-lxgw-wenkai ttf-lxgw-wenkai-mono ttf-yozai-font ttf-myuppy-gb


title "安装dwm"
git clone https://github.com/fengb7e5/dwm.git $CACHE_DIR"/dwm"
cd $CACHE_DIR"/dwm" && make clean install
title "将 dwm 写入用户的xinitrc"
if ! [ -f ~/.xinitrc ]; then
    touch ~/.xinitrc
fi
echo "exec dwm >> .dwm.log" >>~/.xinitrc

title "安装st"
git clone https://github.com/fengb7e5/dwm.git $CACHE_DIR"/st"
cd $CACHE_DIR"/st" && make clean install

title "安装shell脚本文件"
git clone https://github.com/fengb7e5/scripts ~/.dwm

title "安装脚本所需组件"
pacman -S rofi picom-git alsa-utils light acpi

subtitle "蓝牙"
pacman -S bluez bluez-utils

subtitle "网络"
pacman -S networkmanager network-manager-applet

subtitle "通知"
pacman -S libnotify dunst

subtitle "鉴权"
pacman -S lxqt-policykit

subtitle "输入法"
pacman -S fcitx5-im fcitx5-chinese-addons
# 配置输入法环境变量
echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus" >>/etc/environment

subtitle "壁纸"
pacman -S feh xwinwrap-git mpv archlinux-wallpaper

#---------------------------------------------------------------------------#

title "其他组件"

subtitle "浏览器"
pacman -S firefox 

subtitle "代理"
pacman -S yay clash



