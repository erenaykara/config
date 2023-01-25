#!/bin/bash

# get the app id of the focused window
app_id=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .app_id')

# don't copy from windows that have the app id "org.keepassxc.KeePassXC"
if [ $app_id != '"org.keepassxc.KeePassXC"' ]; then
    clipman store --max-items=300 "$@"
fi
