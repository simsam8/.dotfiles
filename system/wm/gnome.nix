
{ pkgs, ... }:
{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
  ];

  # Configure X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, us, no, no";
      variant = ",dvp,,dvorak";
    };
    excludePackages = [ pkgs.xterm ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    };
  services.libinput = {
    touchpad.disableWhileTyping = true;
  };
}
