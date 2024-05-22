#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/.dotfiles/devenvs/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

echo "$selected"

cp "$selected/." ./ -a
direnv allow
