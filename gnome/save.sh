#/bin/sh

dconf dump /org/gnome/shell/extensions/materialshell/ > material-settings.conf
dconf dump /org/gnome/shell/keybindings/ > gnome-keybindings.conf
