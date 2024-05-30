{ userSettings, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    shadow = true;
    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
    fade = true;
    fadeDelta = 5;
    fadeSteps = [
      0.03
      0.03
    ];

    settings = {
      glx-no-stencil = true;
      glx-copy-from-front = false;
      glx-no-rebind-pixmap = true;

      shadow-radius = 9;
      shadow-offset-x = -9.5;
      shadow-offset-y = -9;
      shadow-opacity = 1;

      log-level = "warn";

      frame-opacity = 1;
      inactive-opacity-override = false;

      blur-background-fixed = false;
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      use-ewmh-active-win = true;
      detect-rounded-corners = false;
      detect-client-opacity = true;
      vsync = true;
      dbe = true;
      unredir-if-possible = false;
      detect-client-leader = true;

      wintypes = {
        tooltip = {
          fade = true;
          shadow = true;
          opacity = 0.9;
          focus = true;
        };
      };

      xrender-sync-fence = true;

    };

    shadowExclude = [
      "! name~=''"
      "name = 'Notification'"
      "name = 'Plank'"
      "name = 'Docky'"
      "name = 'Kupfer'"
      "name = 'xfce4-notifyd'"
      "name *= 'VLC'"
      "name *= 'compton'"
      "class_g = 'Firefox' && argb"
      "class_g = 'Conky'"
      "class_g = 'Kupfer'"
      "class_g = 'Synapse'"
      "class_g ?= 'Notify-osd'"
      "class_g ?= 'Cairo-dock'"
      "class_g = 'Cairo-clock'"
      "class_g ?= 'Xfce4-notifyd'"
      "class_g ?= 'Xfce4-power-manager'"
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];
  };
}
