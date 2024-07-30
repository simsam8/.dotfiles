{ pkgs, config, lib, userSettings, systemSettings, ... }:
let
  modifier = "Mod4";
  palette = config.colorScheme.palette;
  keybindsCommon = import ./keybinds/common.nix;
  keybindsG1 = import ./keybinds/group_binds.nix "Group1";
  keybindsG2 = import ./keybinds/group_binds.nix "Group2";
  keybindsG3 = import ./keybinds/group_binds.nix "Group3";
  keybindsG4 = import ./keybinds/group_binds.nix "Group4";

  i3-conf = ''

  set $mod ${modifier}

  font pango:monospace 8


  exec --no-startup-id dex --autostart --environment i3
  exec_always --no-startup-id picom -b 
  exec_always --no-startup-id dunst -config ~/.config/dunst/dunstrc

  exec_always --no-startup-id "setxkbmap -layout us,us,no,no -variant ,dvp,,dvorak -option grp:alt_caps_toggle"

  # exec --no-startup-id xss-lock --transfer-sleep-lock -- ~/.dotfiles-minimal/i3/i3lock.sh #--nofork
  exec --no-startup-id ~/.dotfiles-minimal/i3/idletimer.sh
  exec_always --no-startup-id ~/.config/polybar/scripts/launch.sh

  exec_always --no-startup-id feh --bg-fill --randomize ~/.dotfiles/user/backgrounds/*
  exec --no-startup-id nm-applet

  set $refresh_i3status killall -SIGUSR1 i3status

  floating_modifier $mod

  tiling_drag modifier titlebar

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
  set $ws1 "1"
  set $ws2 "2"
  set $ws3 "3"
  set $ws4 "4"
  set $ws5 "5"
  set $ws6 "6"
  set $ws7 "7"
  set $ws8 "8"
  set $ws9 "9"
  set $ws10 "10"

# Gaps
  gaps inner 4
  gaps outer 4

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
  # bar {
  #         status_command i3status
  # }

  # default_border pixel 1
  # default_floating_border pixel 1
  for_window [class="^.*"] border pixel 2

  ##START THEMING WM

  # Window color settings
  # class                 border  backgr. text    indicator
  client.focused          #${palette.base0D} #${palette.base0D} #${palette.base06} #${palette.base0D}
  client.unfocused        #${palette.base02} #${palette.base00} #${palette.base04} #${palette.base00}
  client.focused_inactive #${palette.base02} #${palette.base00} #${palette.base04} #${palette.base00}
  client.placeholder      #${palette.base02} #${palette.base00} #${palette.base04} #${palette.base00}
  client.urgent           #${palette.base08} #${palette.base08} #${palette.base06} #${palette.base08}

  client.background       #${palette.base00}


  ##STOP THEMING WM

##############
## Keybinds ##
##############


  '';
in
{
  home.file.".config/i3/config".text = i3-conf + keybindsCommon + keybindsG1 + keybindsG2 + keybindsG3 + keybindsG4;
}
