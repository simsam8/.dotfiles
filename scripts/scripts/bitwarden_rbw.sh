#!/usr/bin/env bash

selected=$(rbw list --fields user,name | walker -d)

if [[ -n "$selected" ]]; then
    # Extract username and name from the selected entry
    username=$(echo "$selected" | awk -F'\t' '{print $1}')
    name=$(echo "$selected" | awk -F'\t' '{print $2}')
    
    # Get the password and copy to clipboard
    rbw get "$name" "$username"| wl-copy
    
    # Optional: Show notification
    notify-send "Password Manager" "Password for '$name' copied to clipboard"
fi
