{ pkgs, ... }:
{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
  ];

  services.displayManager = {
    defaultSession = "xfce+i3";
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, us, no, no";
      variant = ",dvp,,dvorak";
      options = "grp:alt_space_toggle";
    };
    excludePackages = [ pkgs.xterm ];
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        rofi
        i3lock
        i3blocks
        i3status
        polybar
      ];
    };
  };

  services.libinput = {
    touchpad.disableWhileTyping = true;
  };
}
