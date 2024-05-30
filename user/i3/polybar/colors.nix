{ config, userSettings, ... }:
let
  palette = config.colorScheme.colors;
in
{
  services.polybar.settings."colors" = with palette; {
    background = base00;
    background-alt = base01;
    background-alt2 = base02;
    buffer = base03;
    foreground = base04;
    nord6 = base06;
    nord7 = base07; 
    nord8 = base0C; 
    nord9 = base0D;
    urgent = base08;
    warning = base09;
    notify = base0A;
    success = base0B; # green
    function = base0E;
  };

}
