#!/usr/bin/env bash

# Set brightness for all monitors
for monitor in $(xrandr --listmonitors | grep "+" | awk '{print $4}')
do
  $(xrandr --output $monitor --brightness $1)
done
