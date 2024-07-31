#!/usr/bin/env bash

bg_dir=~/.dotfiles/user/backgrounds/

random="Random background"
single="Single image for all monitors"
choose="Choose image for each monitor"

bg_type=$(echo "$random
$single
$choose" | rofi -dmenu -i -p "Set background")

# Use a random background
if [ "$bg_type" == "$random" ]
then
  feh --bg-fill --randomize $bg_dir

elif [ "$bg_type" == "$single" ]
then
  bg=$(find $bg_dir -type f -printf '%f\n' | rofi -dmenu -i -p "Select background ${monitor_id}")
  feh --bg-fill "${bg_dir}${bg}"

# Choose background for each monitor
elif [ "$bg_type" == "$choose" ]
then

  bgs_to_set=()
  # Loop through all active monitors
  for monitor_id in $(xrandr --listmonitors | grep "+" | awk '{print substr($1, 1, 1)}')
  do 
    bg=$(find $bg_dir -type f -printf '%f\n' | rofi -dmenu -i -p "Select background ${monitor_id}")
    bgs_to_set+=("${bg_dir}${bg}")
  done
  feh --bg-fill "${bgs_to_set[@]}"

else
  echo "Invalid option"
fi

