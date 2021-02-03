#!/usr/bin/env bash

list_of_apt_packages=(
    git #git repo
    vim
    tree
    xclip #clipbaord tool
    ibus-typing-booster # predicts word when you write them (i use it for emojis)
)

for package in ${list_of_apt_packages[@]}; do
    echo -e "\e[32m[Installing $package] \e[39m"
    sudo apt install $package -y
done
