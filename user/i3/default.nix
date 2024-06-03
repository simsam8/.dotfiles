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
    xorg.xev
    i3lock-color
    xautolock
  ];

  imports = [
    ./i3.nix
    ./picom.nix
    ./polybar
    ./rofi
  ];
}
