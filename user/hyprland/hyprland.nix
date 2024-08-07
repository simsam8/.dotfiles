{pkgs, inputs, config, userSettings, lib, ...}:

let 
  palette = config.colorScheme.palette;

in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      monitor = [
        "desc:BOE 0x0A1F,preferred,auto,1.25"
        "desc:AOC Q32G1WG4 0x000025FB,2560x1440@74.97,auto,1"
        ",preferred,auto,1,mirror,eDP-1"
        # ",preferred,auto,1"
      ];

      exec-once = [
        "~/.dotfiles/user/hyprland/random_background.sh" # set a random background for lock screen
        "hyprlock"
        "pkill waybar & sleep 0.5 && waybar"
        "swww-daemon"
        "~/.dotfiles/user/hyprland/swww_randomize.sh ~/.dotfiles/user/backgrounds/"
        "hyprctl setcursor ${config.gtk.cursorTheme.name} ${builtins.toString config.gtk.cursorTheme.size}"
        "hypridle"
        "dunst"
      ];

      general = {
        layout = "master";
        border_size = 3;
        "col.active_border" = "0xff${palette.base04}";
        "col.inactive_border" = "0x33${palette.base00}";
        resize_on_border = true;
        gaps_in = 2;
        gaps_out = 2;
      };

      input = {
        kb_layout = "us, us, no, no"; 
        kb_variant = "basic, dvp, basic, dvorak";
        kb_options = "grp:alt_space_toggle";
        resolve_binds_by_sym = 1;

        follow_mouse = 1;

        touchpad = {
            natural_scroll = true;
        };

        tablet = {
          transform = 0;
          # output = "HDMI-A-1";
          output = "eDP-1";
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        # inactive_opacity = 0.75

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          ignore_opacity = true;
          contrast = 1.17;
          brightness = 0.8;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      layerrule = [
        "blur, logout_dialog"
      ];


      bind =
        [
          "$mod, T, exec, alacritty"
          "$mod, V, exec, vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland"
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

        ", XF86Keyboard, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next"
      ];
      bindle = [
        # volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"

        # Screen brightness
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
      ];
    };
  };
}
