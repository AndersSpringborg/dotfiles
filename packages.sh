#!/usr/bin/env bash

logStatus "Installing packages";

list_of_apt_packages=(
    vim
    tree
    xclip #clipbaord tool
    ibus-typing-booster # predicts word when you write them (i use it for emojis)
    curl
    npm
    gcc
    g++
    make
    libportaudio2
    python3-venv
    chrome-gnome-shell
)

list_of_all_wget_packages=(
    https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 # vscode
    https://downloads.slack-edge.com/linux_releases/slack-desktop-4.13.0-amd64.deb # slack
)

list_of_snap_pcakages=(
    vlc
)

## do somehitng like
for package in ${list_of_apt_packages[@]}; do
    logInfo "Installing $package";
    logInfo "not implemented"
    #wget $package
    # google tmp folder, how to do delete file after
    #sudo apt install ./$package -y
done

for package in ${list_of_apt_packages[@]}; do
    logInfo "Installing $package";
    sudo apt install $package -y
done

installNode(){
    curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
    sudo apt-get install -y nodejs
}
logStatus "Installing Node"
installNode;
unset installNode;

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

