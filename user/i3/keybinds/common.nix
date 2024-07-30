let 
keybinds = ''
# Audio controls
  bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
  bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
  bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
  bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
  bindsym XF86AudioPlay exec --no-startup-id playerctl play-pause
  bindsym XF86AudioNext exec --no-startup-id playerctl next
  bindsym XF86AudioPrev exec --no-startup-id playerctl previous

# Screen brightness
  bindsym XF86MonBrightnessDown exec brightnessctl s 5%-
  bindsym XF86MonBrightnessUp exec brightnessctl s +5%

# change focus
  bindsym $mod+Left focus left
  bindsym $mod+Down focus down
  bindsym $mod+Up focus up
  bindsym $mod+Right focus right

# move focused window
  bindsym $mod+Shift+Left move left
  bindsym $mod+Shift+Down move down
  bindsym $mod+Shift+Up move up
  bindsym $mod+Shift+Right move right

# move workspace 
  bindsym $mod+Control+Shift+Left move workspace to output left
  bindsym $mod+Control+Shift+Down move workspace to output down
  bindsym $mod+Control+Shift+Up move workspace to output up
  bindsym $mod+Control+Shift+Right move workspace to output right


# switch to workspace by number row
  bindcode $mod+10 workspace number $ws1
  bindcode $mod+11 workspace number $ws2
  bindcode $mod+12 workspace number $ws3
  bindcode $mod+13 workspace number $ws4
  bindcode $mod+14 workspace number $ws5
  bindcode $mod+15 workspace number $ws6
  bindcode $mod+16 workspace number $ws7
  bindcode $mod+17 workspace number $ws8
  bindcode $mod+18 workspace number $ws9
  bindcode $mod+19 workspace number $ws10

# switch to workspace by numpad
  bindcode $mod+87 workspace number $ws1
  bindcode $mod+88 workspace number $ws2
  bindcode $mod+89 workspace number $ws3
  bindcode $mod+83 workspace number $ws4
  bindcode $mod+84 workspace number $ws5
  bindcode $mod+85 workspace number $ws6
  bindcode $mod+79 workspace number $ws7
  bindcode $mod+80 workspace number $ws8
  bindcode $mod+81 workspace number $ws9
  bindcode $mod+90 workspace number $ws10

# move focused container to workspace by number row
  bindcode $mod+Shift+10 move container to workspace number $ws1
  bindcode $mod+Shift+11 move container to workspace number $ws2
  bindcode $mod+Shift+12 move container to workspace number $ws3
  bindcode $mod+Shift+13 move container to workspace number $ws4
  bindcode $mod+Shift+14 move container to workspace number $ws5
  bindcode $mod+Shift+15 move container to workspace number $ws6
  bindcode $mod+Shift+16 move container to workspace number $ws7
  bindcode $mod+Shift+17 move container to workspace number $ws8
  bindcode $mod+Shift+18 move container to workspace number $ws9
  bindcode $mod+Shift+19 move container to workspace number $ws10

# move focused container to workspace by numpad
  bindcode $mod+Shift+87 move container to workspace number $ws1
  bindcode $mod+Shift+88 move container to workspace number $ws2
  bindcode $mod+Shift+89 move container to workspace number $ws3
  bindcode $mod+Shift+83 move container to workspace number $ws4
  bindcode $mod+Shift+84 move container to workspace number $ws5
  bindcode $mod+Shift+85 move container to workspace number $ws6
  bindcode $mod+Shift+79 move container to workspace number $ws7
  bindcode $mod+Shift+80 move container to workspace number $ws8
  bindcode $mod+Shift+81 move container to workspace number $ws9
  bindcode $mod+Shift+90 move container to workspace number $ws10
'';
in
keybinds
