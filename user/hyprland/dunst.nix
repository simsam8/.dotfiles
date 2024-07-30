{ pkgs, config, userSettings, ... }:
let
  palette = config.colorScheme.palette;
in
{
services.dunst = {
    enable = true;
    settings = {
      global = {
        # browser = "${config.programs.firefox.package}/bin/firefox -new-tab";
        # dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
        follow = "mouse";
        font = "${userSettings.font}";
        format = "<b>%s</b>\\n%b";
        frame_color = "#${palette.base00}";
        frame_width = 2;
        # geometry = "500x5-5+30";
        horizontal_padding = 8;
        icon_position = "off";
        line_height = 0;
        markup = "full";
        padding = 8;
        separator_color = "frame";
        separator_height = 2;
        transparency = 10;
        word_wrap = true;
        corner_radius = 15;
      };

      urgency_low = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        frame_color = "#${palette.base0C}";
        timeout = 10;
      };

      urgency_normal = {
        background = "#${palette.base00}";
        foreground ="#${palette.base05}";
        frame_color = "#${palette.base0B}";
        timeout = 15;
      };

      urgency_critical = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        frame_color = "#${palette.base08}";
        timeout = 0;
      };

      # shortcuts = {
      #   context = "mod4+grave";
      #   close = "mod4+shift+space";
      # };
    };
  };}
