#!/usr/bin/env bash

# Logging.
logFile(){
    printf "\e[32m[$1] \e[39m\n"
}

logStatus(){
    printf " \e[96m~$1~\e[39m\n"
}

logInfo(){
    printf "  \e[94m$1\e[39m\n"
}

logFile "Starting dotfiles install";

git pull origin master

moveDotfilesToHome() {
    home=~;
    rsync \
        --exclude ".git/" \
        -avh \
        --no-perms \
        .[A-z_-]* \
        $home;
        # achive, verbose, h?
        # Don't keep permissions
        # regex for ".any"
}

function sourceSetupFiles() {
    for sh_file in [A-z_-]*.sh; do
        if [ "$sh_file" != "bootstrap.sh" ]; then
            logFile "$sh_file"
            source "$sh_file";
        fi;
    done;
}



read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    moveDotfilesToHome;
    sourceSetupFiles;
    source ~/.bash_profile;
fi;

logFile "Finishing dotfiles install";


unset moveDotfilesToHome;
unset sourceSetupFiles;
unset logFile;
unset logStatus;
unset logInfo;
