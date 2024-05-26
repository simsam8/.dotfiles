{ pkgs, lib, userSettings, systemSettings, ... }:
let
  modifier = "Mod4";
in
{
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;

      config = {
        inherit modifier;

        bars = [  ];

        gaps = {
          inner = 10;
          outer = 5;
        };

        keybindings = {
          # Alacritty terminal
          "${modifier}+t" = "exec ${pkgs.alacritty}/bin/alacritty"; # key: t
          
          # Dmenu
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

           # Movement
          "${modifier}+j" = "focus down";
          "${modifier}+k"= "focus up";
          "${modifier}+h" = "focus left";
          "${modifier}+l" = "focus right";

          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Left" = "focus left";
          "${modifier}+Right" = "focus right";


           # Misc
          "${modifier}+shift+q" = "kill";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+z" = "split h";
          "${modifier}+x" = "split v";
          "${modifier}+r" = "mode resize";
          "${modifier}+q" = "kill";

          "${modifier}+1" = "workspace number $ws1";
          "${modifier}+2" = "workspace number $ws2";
          "${modifier}+3" = "workspace number $ws3";
          "${modifier}+4" = "workspace number $ws4";
          "${modifier}+5" = "workspace number $ws5";
          "${modifier}+6" = "workspace number $ws6";
          "${modifier}+7" = "workspace number $ws7";
          "${modifier}+8" = "workspace number $ws8";
          "${modifier}+9" = "workspace number $ws9";
          "${modifier}+0" = "workspace number $ws10";

          # move focused container to workspace
          "${modifier}+Shift+1" = "move container to workspace number $ws1";
          "${modifier}+Shift+2" = "move container to workspace number $ws2";
          "${modifier}+Shift+3" = "move container to workspace number $ws3";
          "${modifier}+Shift+4" = "move container to workspace number $ws4";
          "${modifier}+Shift+5" = "move container to workspace number $ws5";
          "${modifier}+Shift+6" = "move container to workspace number $ws6";
          "${modifier}+Shift+7" = "move container to workspace number $ws7";
          "${modifier}+Shift+8" = "move container to workspace number $ws8";
          "${modifier}+Shift+9" = "move container to workspace number $ws9";
          "${modifier}+Shift+0" = "move container to workspace number $ws10";

          "${modifier}+Shift+r" = "restart";

          # "${modifier}+y" = "exec --no-startup-id setxkbmap -layout us,us,no,no -variant ,dvp,,dvorak -option 'grp:alt_space_toggle'";




        };

        startup = [
          { command = "setxkbmap -layout us,us,no,no"; always = false; }
          { command = "setxkbmap -variant ,dvp,,dvorak"; always = false; }
          { command = "setxkbmap -option 'grp:alt_space_toggle'"; always = false; }
          # { command = "killall -q polybar"; }
          # { command = "--no-startup-id polybar"; always = true; }
        ];

      };

      extraConfig = ''
        # exec --no-startup-id setxkbmap -layout us,us,no,no -variant ,dvp,,dvorak -option 'grp:alt_space_toggle'

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

        bar {
          status_command SCRIPT_DIR=~/.config/i3blocks/scripts i3blocks
        }
      '';
    };
  };


}
