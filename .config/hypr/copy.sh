#!/bin/bash

# Get the app id of the focused window
app_id=$(hyprctl activewindow | grep -oP "class: \K[^\n]*")

# Don't copy from windows that have the app id "org.keepassxc.KeePassXC"
if [ $app_id != 'org.keepassxc.KeePassXC' ]; then
    clipman store --max-items=5000 "$@"
fi
