#!/usr/bin/env bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 300 \
    '~/.dotfiles/i3/set_brightness.sh 0.2' \
    '~/.dotfiles/i3/set_brightness.sh 1' \
  --timer 60 \
    '~/.dotfiles/i3/set_brightness.sh 1; ~/.dotfiles/i3/i3lock.sh'\
    ''\
  --timer 300 \
    '~/.dotfiles/i3/set_brightness.sh 0.2' \
    '~/.dotfiles/i3/set_brightness.sh 1' \
  --timer 3600 \
    'playerctl pause; systemctl suspend'\
    '~/.dotfiles/i3/set_brightness.sh 1' \


