{ userSettings, ... }:

{
  services.polybar.settings = {
    "module/memory" = {
      type = "internal/memory";
      interval = 5;
      format = "<ramp-used><label>";
      label = " %used%/%total%";

      ramp-used-0 = "";
      ramp-used-0-foreground = "\${colors.success}";
      ramp-used-0-weight = 6;
      ramp-used-1 = "";
      ramp-used-1-foreground = "\${colors.warning}";
      ramp-used-2 = "";
      ramp-used-2-foreground = "\${colors.urgent}";
    };
    "module/systray" = {
      type = "internal/tray";

      format-margin = "1";
      tray-spacing = "1";
      # tray-size = "50%";
      # tray-foreground = "\${colors.foreground}";
      # tray-background = "\${colors.background-alt}";
    };

    "module/gpu-memory" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-memory.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.success}";
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
      label-focused-underline = "\${colors.nord7}";
      label-focused-foreground = "\${colors.nord7}";
      label-focused-padding = 1;
      
      # label-unfocused = "•";
      label-unfocused = "%index%";
      label-unfocused-foreground = "\${colors.nord9}";
      label-unfocused-padding = 1;

      # label-urgent = "";
      label-urgent = "%index%";
      label-urgent-foreground = "\${colors.urgent}";
      label-urgent-background = "\${colors.foreground}";
      label-urgent-padding = 1;

      label-visible = "%index%";
      label-visible-padding = 1;

      # separator
      label-separator = "|";
      label-separator-padding = 1;
      label-separator-foreground = "\${colors.buffer}";

      # ws-icon-0 = "1;";
      # ws-icon-1 = "2;";
      # ws-icon-2 = "3;";
      # ws-icon-3 = "4;";
      # ws-icon-4 = "5;";
      # ws-icon-5 = "6;";
      # ws-icon-6 = "7;";
      # ws-icon-7 = "8;";
      # ws-icon-8 = "9;";
      # ws-icon-9 = "10;";
      # ws-icon-default = "";
    };

    "module/xwindow" = {
      type = "internal/xwindow";
      format-foreground = "\${colors.nord7}";
      format-underline = "\${colors.nord7}";
      format-padding = 4;

      label-maxlen = 20;
      label-empty = "Desktop";
    };
    
    "module/filesystem" = {
      type = "internal/fs";
      interval = 30;

      mount-0 = "/";

      format-mounted = "<ramp-capacity><label-mounted>";
      label-mounted = " %free%/%total%";

      ramp-capacity-0 = "";
      ramp-capacity-0-foreground = "\${colors.urgent}";
      ramp-capacity-1 = "";
      ramp-capacity-1-foreground = "\${colors.warning}";
      ramp-capacity-2 = "";
      ramp-capacity-2-foreground = "\${colors.success}";
      ramp-capacity-3 = "";
      ramp-capacity-3-foreground = "\${colors.nord7}";
      ramp-capacity-4 = "";
      ramp-capacity-4-foreground = "\${colors.nord7}";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";

      master-soundcard = "default";
      speaker-soundcard = "default";
      headphone-soundcard = "default";

      master-mixer = "Master";

      format-volume = "<ramp-volume> <label-volume>";
      format-volume-underline = "\${colors.function}";

      label-muted = " ";
      label-muted-foreground = "\${colors.urgent}";
      label-muted-underline = "\${colors.urgent}";

      ramp-volume-0 = "";
      ramp-volume-0-foreground = "\${colors.success}";
      ramp-volume-1 = "";
      ramp-volume-1-foreground = "\${colors.notify}";
      ramp-volume-2 = "";
      ramp-volume-2-foreground = "\${colors.urgent}";

      ramp-headphones-0 = "";

      ramp-volume-foreground = "\${colors.nord7}";
      click-right = "pavucontrol";
    };
    
    "module/keyboard" = {
      type = "internal/xkeyboard";
      blacklist-0 = "num lock";
      blacklist-1 = "scroll lock";

      format = "<label-layout> <label-indicator>";
      # label-layout = "󰌌 %name%";
      label-layout = " %name%";
      # label-layout-foreground = ${colors.primary};

      label-indicator-padding = 2;
      label-indicator-margin = 1;
      # layout-icon-default = "";
      label-indicator-on-capslock = "󰌎";
      label-indicator-on-capslock-foreground = "\${colors.warning}";
      label-indicator-on-capslock-underline = "\${colors.warning}";

      # label-indicator-on-numlock = "";
      # label-indicator-on-numlock-foreground = "\${colors.warning}";
      # label-indicator-on-numlock-underline = "\${colors.warning}";
    };
    "module/cpu" = {
      type = "internal/cpu";
      interval = 5;
      format = "<ramp-load> <label>";


      ramp-load-0 = "";
      ramp-load-0-foreground = "\${colors.success}";
      ramp-load-0-weight = 8;
      ramp-load-1 = "";
      ramp-load-1-foreground = "\${colors.warning}";
      ramp-load-2 = "";
      ramp-load-2-foreground = "\${colors.urgent}";
    };

    "module/gpu" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-usage.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.success}";
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
      label-connected = "󰈁  %upspeed%  %downspeed%";
      # label-disconnected = "󰈂";
    };

    "module/network-wireless" = {
      "inherit" = "module/network-base";
      interface-type = "wireless";
      format-connected = "%{A1:networkmanager_dmenu:}<ramp-signal><label-connected> %{A}";
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
      format-warn-background = "\${colors.foreground}";

      label-warn = " %temperature-c%";
      label-warn-padding = 1;
      label-warn-foreground = "\${colors.urgent}";
      label-warn-background = "\${colors.foreground}";

      ramp-0 = "";
      ramp-1 = "";
      ramp-2 = "";
      ramp-3 = "";
      ramp-4 = "";

      ramp-0-foreground = "\${colors.nord8}";
      ramp-1-foreground = "\${colors.nord8}";
      ramp-2-foreground = "\${colors.success}";
      ramp-3-foreground = "\${colors.warning}";
      ramp-4-foreground = "\${colors.urgent}";


      interval = 5;
    };

    "module/gpu-temp" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/gpu-temp.sh";
      format-prefix = "GPU  ";
      format-prefix-foreground = "\${colors.success}";
      interval = 5;
    };

    "module/date" = {
      type = "internal/date";
      interval = 1;

      date = "%H:%M";
      date-alt = "%Y-%m-%d %a";
      format = "<label>";

      label = " %date%";
      label-margin = 1;
      label-underline = "\${colors.nord8}";
    };

    "module/battery" = {
      type = "internal/battery";
      full-at = 100;
      low-at = 20;
      battery = "BAT0";
      adapter = "ADP0";

      format-charging = "<animation-charging> <label-charging>";
      format-charging-underline = "\${colors.foreground}";
      animation-charging-0 = "";
      animation-charging-1 = "";
      animation-charging-2 = "";
      animation-charging-3 = "";
      animation-charging-4 = "";
      animation-charging-framerate = 2000;

      format-discharging = "<ramp-capacity> <label-discharging>";
      format-discharging-underline = "\${colors.notify}";
      ramp-capacity-0 = "";
      ramp-capacity-1 = "";
      ramp-capacity-2 = "";
      ramp-capacity-3 = "";
      ramp-capacity-4 = "";
      ramp-capacity-foreground = "\${colors.notify}";

      label-full = "";
      label-full-foreground = "\${colors.success}";
      label-full-underline = "\${colors.success}";
    };

    "module/brightnessctl" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/brightnessctl.sh";

      scroll-up = "exec brightnessctl set +5%";
      scroll-down = "exec brightnessctl set -5%";
      interval = 0.5;

      label = "%output%";
      label-foreground = "\${colors.foreground}";
    };

    # "module/powermenu" = {
    #   type = "custom/menu";
    #   expand-right = true;
    #   format-spacing = 2;
    #   format-padding = 2;
    #   format-underline = "\${colors.urgent}";
    #   label-open = "󰐥";
    #   label-underline = "\${colors.urgent}";
    #
    #   label-open-foreground = "\${colors.urgent}";
    #   label-close = "";
    #   label-close-foreground = "\${colors.warning}";
    #   label-separator = "|";
    #   label-separator-foreground = "\${colors.success}";
    #
    #   menu-0-0 = "󰑓";
    #   menu-0-0-foreground = "\${colors.success}";
    #   menu-0-0-exec = "reboot";
    #
    #   # logout
    #   menu-0-1 = "󰍃";
    #   menu-0-1-foreground = "\${colors.warning}";
    #   menu-0-1-exec = "i3-msg exit";
    #
    #   menu-0-2 = "󰐥";
    #   menu-0-2-foreground = "\${colors.urgent}";
    #   menu-0-2-exec = "shutdown";
    #
    # };

    "module/powermenu" = {
      type = "custom/text";
      click-left = "rofi -show power-menu -modi power-menu:rofi-power-menu";
      # format-spacing = 1;
      format-padding = 2;
      format-underline = "\${colors.urgent}";
      label = "󰐥  ";
      label-underline = "\${colors.urgent}";
      label-foreground = "\${colors.urgent}";
    };

    "module/bluetooth" = {
      type = "custom/script";
      exec = "rofi-bluetooth --status";
      format-foreground = "\${colors.nord7}";
      format-underline = "\${colors.nord7}";
      format-padding = 2;
      interval = 1;
      click-left = "rofi-bluetooth";
      # click-right = "blueman-manager";
    };

    "module/dunst" = {
      type = "custom/ipc";
      initial = 1;
      format-foreground = "\${colors.notify}";
      hook-0 = "echo \"%{A1:dunstctl set-paused true && polybar-msg hook dunst 2:}%{A}\" &";
      hook-1 = "echo \"%{A1:dunstctl set-paused false && polybar-msg hook dunst 1:}%{A}\" &";
    };
  };
}
