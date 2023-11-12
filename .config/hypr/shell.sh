#!/bin/bash

if [ -z "$SSH_AUTH_SOCK" ]; then
    # Start ssh-agent on login
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-env
    fi

    # Load ssh-agent environment variables
    source ~/.ssh-agent-env > /dev/null

    # Start keychain to manage ssh-agent and gpg-agent
    keychain --quiet --eval --agents ssh,gpg > /dev/null
fi

echo -e -n ":term\n:keepalt file initial.terminal\ni" | nvim -s -
