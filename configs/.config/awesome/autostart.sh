#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}


run /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
run nm-applet

