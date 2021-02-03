#!/usr/bin/env bash

logDotfiles "Installing \"The Fuck\"";

if ! command -v COMMAND &> /dev/null; then
    echo "[theFUCK is allready installed]";
else
    sudo apt update;
    sudo apt install python3-dev python3-pip python3-setuptools -y;
    sudo pip3 install thefuck;
fi;
