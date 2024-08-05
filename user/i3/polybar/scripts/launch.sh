#!/usr/bin/env bash


pkill polybar
outputs=$(xrandr --query | awk '/ connected/{ print $1 }')

# we want the tray to be consistently displayed on primary display
tray=$(xrandr --query | awk '/primary/{ print $1 }')

if type "xrandr"; then
  # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  for m in $outputs; do
    if [[ $m == $tray ]]; then
      MONITOR=$m polybar --reload top & disown
      MONITOR=$m polybar --reload bottom-primary & disown
    else
      MONITOR=$m polybar --reload top & disown
      MONITOR=$m polybar --reload bottom & disown
    fi
  done
else
  polybar --reload top & disown
  polybar --reload bottom-primary & disown
fi
