{ pkgs, config, lib, userSettings, systemSettings, ... }:
let
  modifier = "Mod4";
  palette = config.colorScheme.colors;
  keybinds = import ./keybinds.nix;
in
{
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;

      config = {
        inherit modifier;
        keybindings = keybinds.keybindings;
        keycodebindings = keybinds.keycodebindings;

        bars = [  ];

        gaps = {
          inner = 10;
          outer = 5;
        };

        startup = [
          { command = "--no-startup-id setxkbmap -layout us,us,no,no"; always = true; }
          { command = "--no-startup-id setxkbmap -variant ,dvp,,dvorak"; always = true; }
          { command = "--no-startup-id setxkbmap -option grp:alt_space_toggle"; always = true; }
          { command = "--no-startup-id xrandr --output HDMI-0 --right-of eDP-1-1";}
          { command = "--no-startup-id ~/.config/polybar/scripts/launch.sh"; always = true; }
          { command = "--no-startup-id xinput map-to-output 29 eDP-1-1"; always = true; } # map wacom stylus to laptop screen
          { command = "--no-startup-id xinput set-prop SYNA2BA6:00 06CB:CE78 Touchpad libinput Natural Scrolling Enabled 1"; always = true; }
          { command = "--no-startup-id feh --bg-fill --randomize ~/.dotfiles/user/backgrounds/*"; always = true;}
          { command = "--no-startup-id picom -b"; always = true;}
          { command = "--no-startup-id xautolock -time 5 -locker ~/.dotfiles/user/i3/i3lock.sh"; always = false; } # lock screen after 5 min
        ];

      };

      extraConfig = ''
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

        workspace 1 output eDP-1-1
        workspace 3 output HDMI-0

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
      '';
    };
  };


}
