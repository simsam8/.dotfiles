{ config, userSettings, ... }:
let
  palette = config.colorScheme.palette;
in
{
  services.polybar.settings."colors" = with palette; {
    bg = base00; 
    bg-alt = base01;
    fg = base06;
    fg-alt = base05;

    blue = base0D;
    cyan = base0C;
    green = base0B;
    orange = base09;
    purple = base0E;
    red = base08;
    yellow = base0A;

    black = "#000";
    white = "#FFF";

    trans = "#00000000";
    semi-trans-black = "#aa000000";
  };
}
