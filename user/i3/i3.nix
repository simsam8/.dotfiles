{ pkgs, config, lib, userSettings, systemSettings, ... }:
let
  modifier = "Mod4";
  palette = config.colorScheme.colors;
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

        # keycodebindings = {
        #   "${modifier}+20" = "exec ${pkgs.alacritty}/bin/alacritty"; # key: t
        #   "${modifier}+25" = "exec spotify"; # key: p
        # };

        keybindings = {
          # Alacritty terminal
          "${modifier}+t" = "exec --no-startup-id ${pkgs.alacritty}/bin/alacritty"; # key: t
          
          # Dmenu
          "${modifier}+d" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show drun";

           # Move between containers
          "${modifier}+j" = "focus down";
          "${modifier}+k"= "focus up";
          "${modifier}+h" = "focus left";
          "${modifier}+l" = "focus right";

          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Left" = "focus left";
          "${modifier}+Right" = "focus right";

          # Move containers
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k"= "move up";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+l" = "move right";

          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up"= "move up";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Right" = "move right";


           # Misc
          "${modifier}+shift+q" = "kill";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+z" = "split h";
          "${modifier}+x" = "split v";
          "${modifier}+r" = "mode resize";
          "${modifier}+q" = "kill";

          # Move to workspaces
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

          # Move workspaces between monitors
          "${modifier}+Control+Shift+j" = "move workspace to output down";
          "${modifier}+Control+Shift+k"= "move workspace to output up";
          "${modifier}+Control+Shift+h" = "move workspace to output left";
          "${modifier}+Control+Shift+l" = "move workspace to output right";

          "${modifier}+Control+Shift+Down" = "move workspace to output down";
          "${modifier}+Control+Shift+Up"= "move workspace to output up";
          "${modifier}+Control+Shift+Left" = "move workspace to output left";
          "${modifier}+Control+Shift+Right" = "move workspace to output right";

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

          # media controls
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";

          # Audio
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "XF86AudioRaiseVolume" = "exec wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-";

          # Screen brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set +5%";

          # "${modifier}+y" = "exec --no-startup-id setxkbmap -layout us,us,no,no -variant ,dvp,,dvorak -option 'grp:alt_space_toggle'";




        };

        startup = [
          { command = "--no-startup-id setxkbmap -layout us,us,no,no"; always = false; }
          { command = "--no-startup-id setxkbmap -variant ,dvp,,dvorak"; always = false; }
          { command = "--no-startup-id setxkbmap -option 'grp:alt_space_toggle'"; always = false; }
          { command = "--no-startup-id xrandr --output HDMI-0 --right-of eDP-1-1";}
          { command = "--no-startup-id ~/.config/polybar/scripts/launch.sh"; always = true; }
          { command = "--no-startup-id xinput map-to-output 29 eDP-1-1"; always = true; } # map wacom stylus to laptop screen
          { command = "--no-startup-id feh --bg-fill --randomize ~/.dotfiles/user/backgrounds/*"; always = true;}
          { command = "--no-startup-id picom -b"; always = true;}
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
