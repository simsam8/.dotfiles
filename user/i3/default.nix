{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst
    pavucontrol
    brightnessctl
    networkmanager_dmenu
    playerctl
    ffcast
    slop
    xclip
    feh
    libnotify
  ];

  imports = [
    ./i3.nix
    ./picom.nix
    ./polybar
    ./rofi
    ./networkmanager_dmenu.nix
  ];
}
