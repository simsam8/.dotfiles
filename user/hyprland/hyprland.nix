{pkgs, inputs, config, userSettings, lib, ...}:

{
  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    # name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    name = "Quintom_Snow";
    size = 36;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;


    extraConfig = ''
      exec = pkill waybar & sleep 0.5 && waybar
      monitor = ,preferred,auto,1
      exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''
      exec-once = hyprpaper
      exec-once = hypridle
      exec-once = dunst


      # Input config
      input {
        kb_layout = us, us 
        kb_variant = basic, dvp
        kb_model =
        kb_options = grp:alt_space_toggle
        kb_rules =
        resolve_binds_by_sym = 1

        follow_mouse = 1

        touchpad {
            natural_scroll = true
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
      }
      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }
    '';

    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, T, exec, alacritty"
          "$mod, V, exec, vivaldi"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, SPACE, exec, fuzzel"

          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          # ", Print, exec, grimblast copy area"

        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = builtins.toString (x + 10); 
              in [
                "$mod, code:${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, code:${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      bindl = [
        # media controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindle = [
        # volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}
