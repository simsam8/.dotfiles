{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    dunst
    waybar
    fuzzel
    hyprlock
    hypridle
    # hyprpaper
    swww
    pavucontrol
    brightnessctl
    wev
    # networkmanagerapplet
    dmenu
    networkmanager_dmenu
  ];

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./fuzzel.nix
    ./wlogout.nix
    ./hypridle.nix
    # ./hyprpaper.nix
    ./hyprlock.nix
  ];

}
