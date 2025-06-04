{ userSettings, ... }:

{
  home.file.".config/picom/picom.conf".text = ''
  backend = "glx";
  shadow = false;

  glx-no-stencil = true;
  glx-no-rebind-pixmap = true;
  glx-copy-from-front = false;

  vsync = true;
  dbe = true;
  mark-wmin-focused = true;
  mark-ovredir-focused = true;
  detect-rounded-corners = false;
  detect-client-opacity = true;
  use-ewmh-active-win = true;
  unredir-if-possible = false;
  detect-client-leader = true;
  xrender-sync-fence = true;

  frame-opacity = 1;
  active-opacity = 1.0;
  inactive-opacity = 1.0;
  inactive-opacity-override = false;

  fade = true;
  fade-delta = 10;
  fade-in-step = 0.03;
  fade-out-step = 0.03;

  blur-background-fixed = false;
  blur-background-exclude = [
    "window_type = 'dock'"
    # "window_type = 'desktop'"
    # "_GTK_FRAME_EXTENTS@:c"
  ];

  wintypes:
  {
    tooltip = { fade = true; shadow = true; opacity = 0.9; focus = true; };
  };


  shadow-radius = 9;
  shadow-offset-x = -9.5;
  shadow-offset-y = -9;
  shadow-opacity = 1;

  log-level = "warn";
  shadowExclude = [
    "! name~=\'\'"
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
  
  '';
}
