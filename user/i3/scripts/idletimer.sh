#!/usr/bin/env bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 300 \
    '~/.config/i3/scripts/set_brightness.sh 0.2' \
    '~/.config/i3/scripts/set_brightness.sh 1' \
  --timer 60 \
    '~/.config/i3/scripts/set_brightness.sh 1; ~/.config/i3/scripts/i3lock.sh'\
    ''\
  --timer 300 \
    '~/.config/i3/scripts/set_brightness.sh 0.2' \
    '~/.config/i3/scripts/set_brightness.sh 1' \
  --timer 3600 \
    'playerctl pause; systemctl suspend'\
    '~/.config/i3/scripts/set_brightness.sh 1' \


