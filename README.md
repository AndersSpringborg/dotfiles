# Welcome
This is my dotifles repo

## Install
To install the these dotfiles
`source bootstrap.sh`

## Config
It is based on ubuntu
Specs
    - Desktop envirorment: Gnome 3
    - Window manager: Mutter
    - Shell: Bash 5.0

Ethernet drive 
https://www.realtek.com/en/directly-download?downloadid=95f1076134d28cfcebcb49fc65a6811e
    

## Contirbuting
`bootstrap.sh` is the main file
1. this moves all . files into the home folder
2. runs all `sh` script in the project
3. calls the noew bash entrypoint (`source ~/.bash_profile;`)


## Todo
[ ] make --first-install argument

[ ] install docker
[ ] Fix docker compose in install

> sudo curl -L "https://github.com/docker/compose/releases/download/1.28.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

[ ] install xclip before ssh keygen
[ ] ssh make rsa
[ ] install chrome
[ ] intsall code
[ ] install jetbrains toolbox
[ ] spotify ask if i want to continu
[ ] install the fuck -> the if else condition do not work
[ ] install slack
[ ] add guide for keyboard setup with typebooster
    - https://mike-fabian.github.io/ibus-typing-booster/documentation.html#adding-gnome

[ ] make into python script, to make a real CLI

[ ] Linux mods
- [ ] remove double press for ` sign

[ ] Add some documentation to print functions
    logStatus
    logInfo
    logWarning

[ ] cli chenage gnome background to color
    `gsettings set org.gnome.desktop.background picture-uri ''`
    `gsettings set org.gnome.desktop.background primary-color '#606060'`

[ ] make gnome_customize file
    - [ ] minimize applications on press

[ ] dual boot option
    - [ ] local time `timedatectl set-local-rtc 1 --adjust-system-clock`