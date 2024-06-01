let
  modifier = "Mod4";
in 
{
  keybindings = {
    # Alacritty terminal
    "Group1+${modifier}+t" = "exec --no-startup-id alacritty"; # key: t
    "Group2+${modifier}+t" = "exec --no-startup-id alacritty"; # key: t
    
    # Dmenu
    "Group1+${modifier}+d" = "exec --no-startup-id rofi -show drun";
    "Group2+${modifier}+d" = "exec --no-startup-id rofi -show drun"; # key: d

     # Move between containers
    "Group1+${modifier}+j" = "focus down";
    "Group1+${modifier}+k"= "focus up";
    "Group1+${modifier}+h" = "focus left";
    "Group1+${modifier}+l" = "focus right";
    "Group2+${modifier}+j" = "focus down";
    "Group2+${modifier}+k"= "focus up";
    "Group2+${modifier}+h" = "focus left";
    "Group2+${modifier}+l" = "focus right";

    # Move containers
    "Group1+${modifier}+Shift+j" = "move down";
    "Group1+${modifier}+Shift+k"= "move up";
    "Group1+${modifier}+Shift+h" = "move left";
    "Group1+${modifier}+Shift+l" = "move right";
    "Group2+${modifier}+Shift+j" = "move down";
    "Group2+${modifier}+Shift+k"= "move up";
    "Group2+${modifier}+Shift+h" = "move left";
    "Group2+${modifier}+Shift+l" = "move right";

     # Misc
    "Group1+${modifier}+shift+q" = "kill";
    "Group1+${modifier}+f" = "fullscreen toggle";
    "Group1+${modifier}+z" = "split h";
    "Group1+${modifier}+x" = "split v";
    "Group1+${modifier}+r" = "mode resize";

    "Group2+${modifier}+shift+q" = "kill";
    "Group2+${modifier}+f" = "fullscreen toggle";
    "Group2+${modifier}+z" = "split h";
    "Group2+${modifier}+x" = "split v";
    "Group2+${modifier}+r" = "mode resize";

    # Move workspaces between monitors
    "Group1+${modifier}+Control+Shift+j" = "move workspace to output down";
    "Group1+${modifier}+Control+Shift+k"= "move workspace to output up";
    "Group1+${modifier}+Control+Shift+h" = "move workspace to output left";
    "Group1+${modifier}+Control+Shift+l" = "move workspace to output right";

    "Group2+${modifier}+Control+Shift+j" = "move workspace to output down";
    "Group2+${modifier}+Control+Shift+k"= "move workspace to output up";
    "Group2+${modifier}+Control+Shift+h" = "move workspace to output left";
    "Group2+${modifier}+Control+Shift+l" = "move workspace to output right";

    "Group1+${modifier}+Shift+r" = "restart";
    "Group2+${modifier}+Shift+r" = "restart";

    # Common keybindings 
    "${modifier}+Down" = "focus down";
    "${modifier}+Up" = "focus up";
    "${modifier}+Left" = "focus left";
    "${modifier}+Right" = "focus right";

    "${modifier}+Shift+Down" = "move down";
    "${modifier}+Shift+Up"= "move up";
    "${modifier}+Shift+Left" = "move left";
    "${modifier}+Shift+Right" = "move right";

    "${modifier}+Control+Shift+Down" = "move workspace to output down";
    "${modifier}+Control+Shift+Up"= "move workspace to output up";
    "${modifier}+Control+Shift+Left" = "move workspace to output left";
    "${modifier}+Control+Shift+Right" = "move workspace to output right";

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
  };

  keycodebindings = {

    "${modifier}+10" = "workspace number $ws1";
    "${modifier}+11" = "workspace number $ws2";
    "${modifier}+12" = "workspace number $ws3";
    "${modifier}+13" = "workspace number $ws4";
    "${modifier}+14" = "workspace number $ws5";
    "${modifier}+15" = "workspace number $ws6";
    "${modifier}+16" = "workspace number $ws7";
    "${modifier}+17" = "workspace number $ws8";
    "${modifier}+18" = "workspace number $ws9";
    "${modifier}+19" = "workspace number $ws10";

    "${modifier}+87" = "workspace number $ws1";
    "${modifier}+88" = "workspace number $ws2";
    "${modifier}+89" = "workspace number $ws3";
    "${modifier}+83" = "workspace number $ws4";
    "${modifier}+84" = "workspace number $ws5";
    "${modifier}+85" = "workspace number $ws6";
    "${modifier}+79" = "workspace number $ws7";
    "${modifier}+80" = "workspace number $ws8";
    "${modifier}+81" = "workspace number $ws9";
    "${modifier}+90" = "workspace number $ws10";

    "${modifier}+Shift+10" = "move container to workspace number $ws1";
    "${modifier}+Shift+11" = "move container to workspace number $ws2";
    "${modifier}+Shift+12" = "move container to workspace number $ws3";
    "${modifier}+Shift+13" = "move container to workspace number $ws4";
    "${modifier}+Shift+14" = "move container to workspace number $ws5";
    "${modifier}+Shift+15" = "move container to workspace number $ws6";
    "${modifier}+Shift+16" = "move container to workspace number $ws7";
    "${modifier}+Shift+17" = "move container to workspace number $ws8";
    "${modifier}+Shift+18" = "move container to workspace number $ws9";
    "${modifier}+Shift+19" = "move container to workspace number $ws10";

    "${modifier}+Shift+87" = "move container to workspace number $ws1";
    "${modifier}+Shift+88" = "move container to workspace number $ws2";
    "${modifier}+Shift+89" = "move container to workspace number $ws3";
    "${modifier}+Shift+83" = "move container to workspace number $ws4";
    "${modifier}+Shift+84" = "move container to workspace number $ws5";
    "${modifier}+Shift+85" = "move container to workspace number $ws6";
    "${modifier}+Shift+79" = "move container to workspace number $ws7";
    "${modifier}+Shift+80" = "move container to workspace number $ws8";
    "${modifier}+Shift+81" = "move container to workspace number $ws9";
    "${modifier}+Shift+90" = "move container to workspace number $ws10";
  };
}
