{pkgs, inputs, config, userSettings, lib, ...}:

{
  home.packages = with pkgs; [
    dunst
    waybar
    fuzzel
    hyprlock
    hypridle
    hyprpaper
    pavucontrol
    wev
    # networkmanagerapplet
    dmenu
    networkmanager_dmenu
  ];

  imports = [
    ./waybar.nix
  ];

  programs.fuzzel = {
    enable = true;
    settings = with config.colorScheme.colors; {
      main = {
        dpi-aware = "yes";
        font = "${userSettings.font}:weight=bold";
      };
      colors = {
        background = "${base00}bf";
        text = "${base06}ff";
        match = "${base0C}ff";
        selection = "${base06}bf";
        selection-text = "${base00}ff";
        selection-match = "${base0D}ff";
        border = "${base02}ff";
      };
      border.width = 2;
      border.radius = 20;
    };
  };

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

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/user/backgrounds/nixos.png
    wallpaper = , ~/.dotfiles/user/backgrounds/nixos.png
  '';

  # TODO: Configure with nix-colors

  home.file.".config/hypr/hyprlock.conf".text = ''
     background {
        monitor =
        #path = /home/me/someImage.png   # supports png, jpg, webp (no animations, though)
        color = rgba(25, 20, 20, 1.0)

        # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
        blur_passes = 0 # 0 disables blurring
        blur_size = 7
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    } 
    input-field {
        monitor =
        size = 200, 50
        outline_thickness = 3
        dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = false
        dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
        outer_color = rgb(151515)
        inner_color = rgb(200, 200, 200)
        font_color = rgb(10, 10, 10)
        fade_on_empty = false
        fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
        placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
        hide_input = false
        rounding = -1 # -1 means complete rounding (circle/oval)
        check_color = rgb(204, 136, 34)
        fail_color = rgb(204, 34, 34) # if authentication failed, changes outer_color and fail message color
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
        fail_transition = 300 # transition time in ms between normal outer_color and fail_color
        capslock_color = -1
        numlock_color = -1
        bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false # change color if numlock is off
        swap_font_color = false # see below

        position = 0, -20
        halign = center
        valign = center
    }
    label {
      monitor =
      text = Hi there, $USER
      text_align = center # center/right or any value for default left. multi-line text alignment inside label container
      color = rgba(200, 200, 200, 1.0)
      font_size = 25
      font_family = Noto Sans
      rotate = 0 # degrees, counter-clockwise

      position = 0, 80
      halign = center
      valign = center
    }
  '';

  home.file.".config/hypr/hypridle.conf".text = ''
  general {
    lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
    before_sleep_cmd = loginctl lock-session    # lock before suspend.
    after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
  }

  listener {
      timeout = 150                                # 2.5min.
      on-timeout = brightnessctl -s set 10         # set monitor backlight to minimum, avoid 0 on OLED monitor.
      on-resume = brightnessctl -r                 # monitor backlight restore.
  }

  # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
  listener { 
      timeout = 150                                          # 2.5min.
      on-timeout = brightnessctl -sd rgb:kbd_backlight set 0 # turn off keyboard backlight.
      on-resume = brightnessctl -rd rgb:kbd_backlight        # turn on keyboard backlight.
  }

  listener {
      timeout = 300                                 # 5min
      on-timeout = loginctl lock-session            # lock screen when timeout has passed
  }

  listener {
      timeout = 330                                 # 5.5min
      on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
      on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
  }

  listener {
      timeout = 1800                                # 30min
      on-timeout = systemctl suspend                # suspend pc
  }
  '';
}
