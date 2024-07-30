{ userSettings, systemSettings, ... }:
let 
  nvidia = systemSettings.nvidia;
in
{
  services.polybar.settings = {

    "bar/base" = {
      theme = "dark";
      monitor = "\${env:MONITOR:}";
      width = "100%";
      height = "2.5%";
      offset-x = 0;
      offset-y = 0;
      radius = 0.0;
      fixed-center = true;


      background = "\${colors.bg-alt}";
      foreground = "\${colors.fg}";

      line-size = "2pt";

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

      # modules-left = "xwindow";
      # modules-left = "i3";
      modules-center = "i3";
      # modules-right = "inhibit-ipc dunst pulseaudio bluetooth battery date powermenu";
      modules-right = "brightnessctl pulseaudio bluetooth network-wired network-wireless battery date";
    };

    "bar/bottom" = {
      "inherit" = "bar/base";
      bottom = true;

      module-margin = 1;

      modules-left = if !nvidia then "systray keyboard filesystem temperature-cpu" else "systray keyboard filesystem gpu-temp temperature-cpu" ;
      # modules-center = "spotify-prev spotify-play-pause spotify-next spotify";
      modules-center = "spotify";
      modules-right = if !nvidia then "memory cpu" else "gpu-memory memory gpu cpu";
    };
  };
}
