#!/usr/bin/env bash
 
# Options for powermenu
lock=" Lock"
logout=" Logout"
shutdown=" Power off"
reboot=" Reboot"
# sleep=" Sleep"
 
# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power Menu")
                  # -theme "$HOME/.dotfiles/user/i3/rofi/powermenu.rasi")
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    # betterlockscreen --lock
    ~/.dotfiles/user/i3/i3lock.sh
elif [ "$selected_option" == "$logout" ]
then
  # loginctl terminate-user "$(whoami)"
    i3-msg exit
elif [ "$selected_option" == "$shutdown" ]
then
    # mpv ~/Music/alaram/shutdown.mp3 &
    # doas systemctl poweroff
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    # doas systemctl reboot
    systemctl reboot
# elif [ "$selected_option" == "$sleep" ]
# then
#     # amixer set Master mute
#     # doas systemctl suspend
#     ~/.dotfiles/user/i3/i3lock-color.sh && systemctl suspend
else
    echo "No match"
fi
 
 
 
 
 
