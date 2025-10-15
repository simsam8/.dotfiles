{ userSettings, ... }:

{
  services.polybar.settings = {
    "module/memory" = {
      type = "internal/memory";
      interval = 5;
      format = "<ramp-used><label>";
      label = " %used%/%total%";
      # format-foreground = "\${colors.blue}";

      ramp-used-0 = "";
      ramp-used-0-foreground = "\${colors.blue}";
      ramp-used-0-weight = 6;
      ramp-used-1 = "";
      ramp-used-1-foreground = "\${colors.orange}";
      ramp-used-2 = "";
      ramp-used-2-foreground = "\${colors.red}";
    };
    "module/systray" = {
      type = "internal/tray";

      format-padding = "1";
      tray-spacing = "1";
      # tray-size = "50%";
      format-foreground = "\${colors.bg}";
      tray-background = "\${colors.blue}";
      format-background = "\${colors.blue}";
      format-underline = "\${colors.fg}";
    };

    "module/gpu-memory" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-memory.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.blue}";
      interval = 5;
    };

    "module/i3" = {
      type = "internal/i3";
      pin-workspaces = false;
      strip-wsnumbers = true;

      index-sort = true;
      enable-click = true;
      enable-scroll = true;
      wrapping-scroll = true;
      reverse-scroll = true;
      fuzzy-match = false;

      format = "<label-state> <label-mode>";

      label-padding = 1;

      # color 
      # label-focused = "";
      label-focused = "%index%";
      label-focused-underline = "\${colors.fg}";
      label-focused-foreground = "\${colors.bg}";
      label-focused-background = "\${colors.blue}";
      label-focused-padding = 1;
      
      # label-unfocused = "•";
      label-unfocused = "%index%";
      label-unfocused-foreground = "\${colors.fg}";
      label-unfocused-padding = 1;

      # label-urgent = "";
      label-urgent = "%index%";
      label-urgent-foreground = "\${colors.red}";
      label-urgent-background = "\${colors.fg}";
      label-urgent-underline = "\${colors.red}";
      label-urgent-padding = 1;

      label-visible = "%index%";
      label-visible-padding = 1;
    };

    "module/xwindow" = {
      type = "internal/xwindow";
      # format-foreground = "\${colors.nord7}";
      # format-underline = "\${colors.nord7}";
      # format-padding = 4;

      label-maxlen = 20;
      # label-empty = "Desktop";
      label-empty = "";
    };
    
    "module/filesystem" = {
      type = "internal/fs";
      interval = 30;
      fixed-values = true;

      mount-0 = "/";

      format-mounted = "<ramp-capacity><label-mounted>";
      label-mounted = " %free%/%total%";

      ramp-capacity-0 = "";
      ramp-capacity-0-foreground = "\${colors.red}";
      ramp-capacity-1 = "";
      ramp-capacity-1-foreground = "\${colors.orange}";
      ramp-capacity-2 = "";
      ramp-capacity-2-foreground = "\${colors.green}";
      ramp-capacity-3 = "";
      ramp-capacity-3-foreground = "\${colors.blue}";
      ramp-capacity-4 = "";
      ramp-capacity-4-foreground = "\${colors.blue}";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";

      master-soundcard = "default";
      speaker-soundcard = "default";
      headphone-soundcard = "default";

      master-mixer = "Master";

      format-volume = "<ramp-volume> <label-volume>";
      # format-volume-underline = "\${colors.function}";

      label-muted = " ";
      # label-muted-foreground = "\${colors.urgent}";
      # label-muted-underline = "\${colors.urgent}";

      ramp-volume-0 = "";
      # ramp-volume-0-foreground = "\${colors.success}";
      ramp-volume-1 = "";
      # ramp-volume-1-foreground = "\${colors.notify}";
      ramp-volume-2 = "";
      # ramp-volume-2-foreground = "\${colors.urgent}";

      ramp-headphones-0 = "";

      # ramp-volume-foreground = "\${colors.nord7}";
      click-right = "pavucontrol";
    };
    
    "module/keyboard" = {
      type = "internal/xkeyboard";
      blacklist-0 = "num lock";
      blacklist-1 = "scroll lock";

      format = "<label-layout> <label-indicator>";
      label-layout = "%{F#81a1c1} %{F-}%name%";

      label-indicator-on-capslock = "󰌎";
      label-indicator-on-capslock-foreground = "\${colors.orange}";

    };
    "module/cpu" = {
      type = "internal/cpu";
      interval = 5;
      format = "<ramp-load> <label>";


      ramp-load-0 = "";
      ramp-load-0-foreground = "\${colors.blue}";
      ramp-load-0-weight = 8;
      ramp-load-1 = "";
      ramp-load-1-foreground = "\${colors.orange}";
      ramp-load-2 = "";
      ramp-load-2-foreground = "\${colors.red}";
    };

    "module/gpu" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-usage.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.blue}";
      interval = 5;
    };

    "module/network-base" = {
      type = "internal/network";
      interval = 5;
      format-connected = "<label-connected>";
      format-disconnected = "<label-disconnected>";
    };

    "module/network-wired" = {
      "inherit" = "module/network-base";
      interface-type = "wired";
      format-connected = "<label-connected>";
      # label-connected = "󰈁  %upspeed%  %downspeed%";
      label-connected = "󰈁";
      # label-disconnected = "󰈂";
    };

    "module/network-wireless" = {
      "inherit" = "module/network-base";
      interface-type = "wireless";
      format-connected = "%{A1:networkmanager_dmenu:}<ramp-signal><label-connected>%{A}";
      label-connected = "%essid%";
      # label-disconnected = "󰤮 ";

      ramp-signal-0 = "󰤯 ";
      ramp-signal-1 = "󰤟 ";
      ramp-signal-2 = "󰤢 ";
      ramp-signal-3 = "󰤥 ";
      ramp-signal-4 = "󰤨 ";
    };

    "module/temperature-cpu" = {
      type = "internal/temperature";
      zone-type = "x86_pkg_temp";
      base-temperature = 30;
      warn-temperature = 85;

      format = "<ramp> <label>";
      format-warn = "<label-warn>";
      # format-warn-background = "\${colors.foreground}";

      label-warn = " %temperature-c%";
      # label-warn-padding = 1;
      label-warn-foreground = "\${colors.red}";
      label-warn-background = "\${colors.fg}";

      ramp-0 = "";
      ramp-1 = "";
      ramp-2 = "";
      ramp-3 = "";
      ramp-4 = "";

      ramp-0-foreground = "\${colors.blue}";
      ramp-1-foreground = "\${colors.blue}";
      ramp-2-foreground = "\${colors.green}";
      ramp-3-foreground = "\${colors.orange}";
      ramp-4-foreground = "\${colors.red}";


      interval = 5;
    };

    "module/gpu-temp" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-temp.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.blue}";
      interval = 5;
    };

    "module/date" = {
      type = "internal/date";
      interval = 1;
      format-background = "\${colors.blue}";
      format-foreground = "\${colors.bg}";
      format-underline = "\${colors.fg}";

      date = "%H:%M";
      date-alt = "%Y-%m-%d %a";
      format = "<label>";

      label = " %date%";
      label-margin = 1;
      # label-underline = "\${colors.nord8}";
    };

    "module/battery" = {
      type = "internal/battery";
      full-at = 97;
      low-at = 20;
      battery = "BAT0";
      adapter = "ADP0";

      format-charging = "<animation-charging> <label-charging>";
      label-charging = "%percentage%%";
      animation-charging-0 = "󰢟";
      animation-charging-1 = "󰢜";
      animation-charging-2 = "󰂆";
      animation-charging-3 = "󰂇";
      animation-charging-4 = "󰂈";
      animation-charging-5 = "󰢝";
      animation-charging-6 = "󰂉";
      animation-charging-7 = "󰢞";
      animation-charging-8 = "󰂊";
      animation-charging-9 = "󰂋";
      animation-charging-framerate = 2000;

      format-discharging = "<ramp-capacity> <label-discharging>";
      label-discharging = "%percentage%%";
      ramp-capacity-0 = "󰂎";
      ramp-capacity-1 = "󰁺";
      ramp-capacity-2 = "󰁻";
      ramp-capacity-3 = "󰁼";
      ramp-capacity-4 = "󰁽";
      ramp-capacity-5 = "󰁾";
      ramp-capacity-6 = "󰁿";
      ramp-capacity-7 = "󰂀";
      ramp-capacity-8 = "󰂁";
      ramp-capacity-9 = "󰂂";

      label-full = "󰁹 %percentage%%";
    };

    "module/brightnessctl" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/brightnessctl.sh";

      scroll-up = "exec brightnessctl s +5%";
      scroll-down = "exec brightnessctl s 5%-";
      interval = 0.1;

      label = "%output%";
      # label-foreground = "\${colors.blue}";
    };

    "module/powermenu" = {
      type = "custom/text";
      click-left = "~/.dotfiles/user/i3/rofi/powermenu.sh";
      format-padding = 2;
      # format-underline = "\${colors.urgent}";
      label = "󰐥  ";
      # label-underline = "\${colors.urgent}";
      # label-foreground = "\${colors.urgent}";
    };

    "module/bluetooth" = {
      type = "custom/script";
      exec = "rofi-bluetooth --status";
      format-foreground = "\${colors.blue}";
      # format-underline = "\${colors.nord7}";
      # format-padding = 2;
      interval = 1;
      click-left = "rofi-bluetooth";
    };

    "module/dunst" = {
      type = "custom/ipc";
      initial = 1;
      format-padding = 2;
      # format-foreground = "\${colors.notify}";
      # format-underline = "\${colors.notify}";
      hook-0 = "echo \"%{A1:dunstctl set-paused true && polybar-msg hook dunst 2:}%{A}\" &";
      hook-1 = "echo \"%{A1:dunstctl set-paused false && polybar-msg hook dunst 1:}%{A}\" &";
    };

    "module/inhibit-ipc" = {
      type = "custom/ipc";
      hook-0 = "echo 󰈈";
      hook-1 = "echo 󰈉";
      # format-foreground = "\${colors.notify}";
      # format-underline = "\${colors.notify}";
      format-padding = 2;
      click-left = "xautolock -enable && xset +dpms && polybar-msg action inhibit-ipc hook 0";
      click-right = "xautolock -disable && xset -dpms && polybar-msg action inhibit-ipc hook 1";
      initial = 1;
    };

    "module/spotify" = {
      type = "custom/script";
      tail = true;
      interval = 1;
      format-prefix = " ";
      format-prefix-foreground = "\${colors.blue}";
      format = "<label>";
      format-underline = "\${colors.fg}";
      exec = "~/.config/polybar/scripts/scroll_spotify_status.sh";
    };

    "module/spotify-prev" = {
      type = "custom/script";
      exec = "echo 󰒮";
      format = "<label>";
      click-left = "playerctl previous";
    };

    "module/spotify-play-pause" = {
      type = "custom/ipc";
      hook-0 = "echo 󰐊";
      hook-1 = "echo 󰏤";
      initial = 1;
      click-left = "playerctl play-pause";
    };

    "module/spotify-next" = {
      type = "custom/script";
      exec = "echo 󰒭";
      format = "<label>";
      click-left = "playerctl next";
    };
  };
}
