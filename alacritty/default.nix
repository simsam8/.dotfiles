{ lib, config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 5;
        y = 5;
      };
      window.dynamic_padding = true;

      window.opacity = lib.mkForce 0.75;
      font = {
        normal = {
          family = "RobotoMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "RobotoMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "RobotoMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "RobotoMono Nerd Font";
          style = "Bold Italic";
        };
      };
      # size = 16;
      cursor.style = "Underline";

      colors = with config.colorScheme.palette; {
        bright = {
          black = "0x${base03}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base09}";
        };
        cursor = {
          cursor = "0x${base06}";
          text = "0x${base00}";
        };
        normal = {
          black = "0x${base00}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base0A}";
        };
        primary = {
          background = "0x${base00}";
          foreground = "0x${base06}";
        };
      };
    };
  };

}
