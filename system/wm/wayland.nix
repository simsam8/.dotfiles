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
    wayland waydroid lightdm
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, us, no, no";
      variant = ",dvp,,dvorak";
    };
  };

  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick.enable = true;
  };
}
