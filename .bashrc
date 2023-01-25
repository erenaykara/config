#!/bin/bash

# remove Desktop and Downloads folders
rm -d -f Desktop Downloads

# source cargo directory
. "$HOME/.cargo/env"

# set environment variables
export EDITOR=nvim
export BROWSER=qutebrowser

# open fish shell
exec fish
