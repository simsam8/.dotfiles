{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-power-menu
    rofi-screenshot
    rofimoji
    ffcast
    slop
    gawk
    ffmpeg
  ];

  imports = [
    ./networkmanager_dmenu.nix
  ];

  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    font = "${userSettings.font} Nerd Font 11";
    extraConfig = {
      modes = "window,drun,run,ssh,combi,keys,filebrowser,calc";
      line-margin = 10;
      display-ssh = "";
      display-run = "";
      display-drun = "";
      display-window = "";
      display-combi = "";
      display-calc = "󰪚";
      show-icons = true;
    };

    theme = ./nord.rasi;
  };
}
