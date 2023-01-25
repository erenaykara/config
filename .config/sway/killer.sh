#!/bin/bash

# get all containers and floating containers
tree=$(swaymsg -t get_tree | jq -r '
	recurse(.nodes[]?) |
	recurse(.floating_nodes[]?) |
	select(.type=="con"), select(.type=="floating_con") |
	(.pid | tostring) + ":" + .window_properties.class + .app_id + ":" + .shell + ":" + .name')

# if there are no active containers, exit the script
if [[ -z "$tree" ]]; then
   exit 0
fi

# create an associative array to hold the rofi entries with their respective id
declare -A entries

# iterate over each container
while read line; do

    # extract container id
    pid="${line%%:*}"
    line="${line#*:}"

    # extract window class / app-id
    class="${line%%:*}"
    line="${line#*:}"

    # extract shell
    shell="${line%%:*}"
    line="${line#*:}"

    # extract container name
    name="${line%%:*}"

    # convert the class name / app-id to lowercase characters
    class="$(echo "$class" | tr '[:upper:]' '[:lower:]')"

    # create formatted entry
    entry="[ $class ] $name"

    # if the container is not using the native wayland backend, add the shell name to the entry
    if [[ "$shell" != "xdg_shell" ]]; then
        entry+=" ($shell)"
    fi

    # if two entries collide, append spaces to the new entry
    while [[ ! -z "${entries[$entry]}" ]]; do
	entry+=' '
    done

    # add id and entry to the list
    entries["$entry"]="$pid"

done <<< "$tree"

# open rofi with the list of all containers
selected="$(printf '%s\n' "${!entries[@]}" | rofi -dmenu -theme theme)"

# if rofi was aborted, exit the script
if [[ $? != 0 ]]; then
    exit 0
fi

# kill the selected process
kill -9 "${entries[$selected]}"
