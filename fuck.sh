#!/usr/bin/env bash

logStatus "Installing \"The Fuck\"";

if ! command -v COMMAND &> /dev/null; then
    logInfo "theFUCK is allready installed";
else
    sudo apt update;
    sudo apt install python3-dev python3-pip python3-setuptools -y;
    pip3 install thefuck;
fi;
