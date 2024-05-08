 { config, pkgs, ... }:

 {
   imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
   ];

   environment.systemPackages = with pkgs;
   [
    wayland waydroid
   ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, us";
      variant = ",dvp";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    # theme = "nord" TODO: add theme
    package = pkgs.sddm;
  };
 }
