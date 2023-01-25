#!/bin/bash

# check command line arguments
if [[ $# != 2 ]]; then
    echo "error: screenshot script expected two parameters"
    echo ""
    echo "usage: screenshot.sh <output directory> <crop>"
    exit 1
fi

# variables
date=$(date +%Y-%m-%d_%H-%m-%s)
temp_image_file="$1/$date.png"

# take the screenshot
if [[ "$2" == "true" ]]; then
    grim -t png -g "$(slurp)" "$temp_image_file"
else
    grim -t png "$temp_image_file"
fi

# if the screenshot was aborted, exit the script
if [[ $? != 0 ]]; then
    exit 1
fi

# get new image name from rofi
new_name=$(echo "$date" | rofi -dmenu -theme theme)

# if the name selection was aborted, remove the temp file and exit the script
if [[ $? != 0 ]]; then
    rm "$temp_image_file"
    exit 1
fi

# if the new file name differs from the temporary file name, move the image
if [[ "$new_name" != "" && "$name_name" != "$date" ]]; then
    new_image_file="$1/$new_name.png"
    mv "$temp_image_file" "$new_image_file"
    notify-send "screenshot saved as $new_name.png"
else
    notify-send "screenshot saved as $temp_image_file"
fi
