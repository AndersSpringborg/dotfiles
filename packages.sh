#!/usr/bin/env bash

list_of_apt_packages="
    git
    vim
    tree
    xclip
"

for package in $list_of_apt_packages; do
   sudo apt install $package
done
