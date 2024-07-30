{ config, userSettings, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = with config.colorScheme.palette; {
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
}
