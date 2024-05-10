{ config, pkgs, userSettings, ... }:

{
  imports = [
  ./pipewire.nix
  ./dbus.nix
  ./gnome-keyring.nix
  ./fonts.nix
  ];

  environment.systemPackages = with pkgs;
  [
    wayland 
    waydroid 
    greetd.greetd
    lightdm
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, us, no, no";
      variant = ",dvp,,dvorak";
    };
  };

  services.xserver.displayManager.lightdm = if userSettings.wm == "hyprland" then {} else {
    enable = true;
    greeters.slick.enable = true;
  };
}
