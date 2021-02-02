#!/usr/bin/env bash

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


read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    moveDotfilesToHome;
fi;

unset moveDotfilesToHome;