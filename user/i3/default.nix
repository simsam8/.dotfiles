{ pkgs, systemSettings, ... }:

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
    feh
    xclip
    picom
    acpi
  ]
  ++ (if systemSettings.profile == "non-nixos" then [] else
  [
    i3lock-color
  ]);

  imports = [
  ./i3.nix
  ./picom.nix
  ./polybar
  ./rofi
  ./dunst.nix
  ./autorandr
  ];

  home.file.".config/i3/scripts" = {
    source = ./scripts;
    recursive = true;
  };

}
