let
  keybinds = group: ''

# start a terminal
  bindsym ${group}+$mod+t exec --no-startup-id i3-sensible-terminal

# start rofi
  bindsym ${group}+$mod+d exec --no-startup-id rofi -show drun
  bindsym ${group}+$mod+c exec --no-startup-id rofi -show calc
  bindsym ${group}+$mod+b exec --no-startup-id ~/.config/rofi/scripts/background_chooser.sh
  bindsym ${group}+$mod+g exec --no-startup-id ~/.config/rofi/scripts/rofi-screenshot.sh
  bindsym ${group}+$mod+Shift+g exec --no-startup-id ~/.config/rofi/scripts/rofi-screenshot.sh -s

# change focus
  bindsym ${group}+$mod+h focus left
  bindsym ${group}+$mod+j focus down
  bindsym ${group}+$mod+k focus up
  bindsym ${group}+$mod+l focus right

# move focused window
  bindsym ${group}+$mod+Shift+h move left
  bindsym ${group}+$mod+Shift+j move down
  bindsym ${group}+$mod+Shift+k move up
  bindsym ${group}+$mod+Shift+l move right

# move workspace
  bindsym ${group}+$modControl+Shift+h move workspace to output left
  bindsym ${group}+$modControl+Shift+j move workspace to output down
  bindsym ${group}+$modControl+Shift+k move workspace to output up
  bindsym ${group}+$modControl+Shift+l move workspace to output right


# powermenu
  bindsym ${group}+$mod+Shift+p exec --no-startup-id ~/.config/rofi/scripts/powermenu.sh

# kill window
  bindsym ${group}+$mod+Shift+q kill

# enter fullscreen mode for the focused container
  bindsym ${group}+$mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
  bindsym ${group}+$mod+s layout stacking
  bindsym ${group}+$mod+w layout tabbed
  bindsym ${group}+$mod+e layout toggle split

# toggle tiling / floating
  bindsym ${group}+$mod+Shift+space floating toggle

# change focus between tiling / floating windows
  bindsym ${group}+$mod+space focus mode_toggle

# focus the parent container
  bindsym ${group}+$mod+a focus parent

# focus the child container
#bindsym ${group}+$mod+d focus child


# reload the configuration file
  bindsym ${group}+$mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
  bindsym ${group}+$mod+Shift+r restart
# exit i3 (logs you out of your X session)

# resize window (you can also use the mouse for that)
  mode "resize" {
          # These bindings trigger as soon as you enter the resize mode

          # Pressing left will shrink the window’s width.
          # Pressing right will grow the window’s width.
          # Pressing up will shrink the window’s height.
          # Pressing down will grow the window’s height.
          bindsym h resize shrink width 10 px or 10 ppt
          bindsym j resize grow height 10 px or 10 ppt
          bindsym k resize shrink height 10 px or 10 ppt
          bindsym l resize grow width 10 px or 10 ppt

          # same bindings, but for the arrow keys
          bindsym Left resize shrink width 10 px or 10 ppt
          bindsym Down resize grow height 10 px or 10 ppt
          bindsym Up resize shrink height 10 px or 10 ppt
          bindsym Right resize grow width 10 px or 10 ppt

          # back to normal: Enter or Escape or $mod+r
          bindsym ${group}+Return mode "default"
          bindsym ${group}+Escape mode "default"
          bindsym ${group}+$mod+r mode "default"
  }

  bindsym ${group}+$mod+r mode "resize"

  '';
in 
keybinds
