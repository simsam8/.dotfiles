{ pkgs, ... }:

{
  home.packages = with pkgs; [
    networkmanager_dmenu
    zscroll
    ranger
    libnotify
    pavucontrol
    xidlehook
    # brightnessctl
    # i3lock-color
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
