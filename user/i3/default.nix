{ pkgs, ... }:

{
  home.packages = with pkgs; [
    networkmanager_dmenu
    zscroll
    ranger
    libnotify
    pavucontrol
    xidlehook
    dunst
    brightnessctl
    playerctl
    i3lock-color
    feh
    xclip
    picom
  ];

  imports = [
  ./i3.nix
  ./picom.nix
  ./polybar
  ./rofi
  ./dunst.nix
  ];

  home.file.".config/i3/scripts" = {
    source = ./scripts;
    recursive = true;
  };

}
