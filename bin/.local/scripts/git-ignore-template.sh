#!/usr/bin/env bash

languages=("Python" "Rust")
selected=$(printf "%s\n" "${languages[@]}" | fzf)
echo "Your choice is $selected"
curl -o .gitignore "https://raw.githubusercontent.com/github/gitignore/main/$selected.gitignore"
echo "Succesfully created gitignore for $selected"
