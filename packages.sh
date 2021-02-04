#!/usr/bin/env bash

logInfo "Installing packages";

list_of_apt_packages=(
    git #git repo
    vim
    tree
    xclip #clipbaord tool
    ibus-typing-booster # predicts word when you write them (i use it for emojis)
    curl
)

for package in ${list_of_apt_packages[@]}; do
    logInfo "\e[96mInstalling $package\e[39m";
    sudo apt install $package -y
done

installSpotify(){
    logInfo "Adding Spotifies repository"
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    
    logInfo "Update apt with added repo"
    sudo apt update
    
    logInfo "Install spotify client"
    sudo apt install spotify-client
}
logStatus "Initiate spotify install"
installSpotify;
unset installSpotify;

