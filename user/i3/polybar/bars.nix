{ userSettings, ... }:

{
  services.polybar.settings = {

    "bar/base" = {
      theme = "dark";
      monitor = "\${env:MONITOR:}";
      width = "100%";
      height = "3%";
      offset-x = 0;
      offset-y = 0;
      radius = 0.0;
      fixed-center = true;


      background = "\${colors.background-alt2}";
      foreground = "\${colors.foreground}";

      line-size = "3pt";

      padding = 0;
      override-redirect = false;
      # wm-restack = "i3";

      cursor-click = "pointer";
      cursor-scroll = "ns-resize";
      
      font-0 = "${userSettings.font} Nerd Font";#2

      enable-ipc = true;
    };

    "bar/top" = {
      "inherit" = "bar/base";

      module-margin = 1;

      modules-left = "xwindow";
      modules-center = "i3";
      modules-right = "dunst pulseaudio bluetooth battery date powermenu";
    };

    "bar/bottom" = {
      "inherit" = "bar/base";
      bottom = true;

      module-margin = 1;

      modules-right = "gpu-temp temperature-cpu gpu-memory memory gpu cpu network-wired network-wireless";
      modules-left = "systray keyboard";
    };
  };
}
