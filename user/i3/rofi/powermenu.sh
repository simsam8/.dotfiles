#!/usr/bin/env bash
 
# Options for powermenu
lock=" Lock"
logout=" Logout"
shutdown=" Power off"
reboot=" Reboot"
sleep=" Sleep"
 
# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power Menu")
                  # -theme "$HOME/.dotfiles/user/i3/rofi/powermenu.rasi")
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    ~/.dotfiles/i3/i3lock.sh
elif [ "$selected_option" == "$logout" ]
then
    i3-msg exit
elif [ "$selected_option" == "$shutdown" ]
then
    # mpv ~/Music/alaram/shutdown.mp3 &
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
#     # amixer set Master mute
#     # doas systemctl suspend
      playerctl pause
      systemctl suspend
#     ~/.dotfiles/user/i3/i3lock-color.sh && systemctl suspend
else
    echo "No match"
fi
 
 
 
 
 
