#!/usr/bin/env bash

file=$(find ~/.dotfiles/user/backgrounds/ -type f | shuf -n 1)
cp "$file" ~/.dotfiles/user/backgrounds/lock.png
