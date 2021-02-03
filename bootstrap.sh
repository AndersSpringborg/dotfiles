#!/usr/bin/env bash

git pull origin master

function moveDotfilesToHome() {
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

function sourceFiles() {
    for sh_file in [A-z_-]*.sh; do
        if [ "$sh_file" != "bootstrap.sh" ]; then
            source $sh_file;
        fi;
    done;
}



read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    moveDotfilesToHome;
    source ~/.bash_profile;
    sourceFiles;
fi;

unset moveDotfilesToHome;
unset sourceFiles;
