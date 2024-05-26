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
    # displayManager = {
    #   lightdm.enable = true;
    #   sessionCommands = ''
    #   xset -dpms
    #   xset s blank
    #   xset r rate 350 50
    #   xset s 300
    #   '';
    # };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3lock
        i3blocks
      ];
    };
  };

  services.libinput = {
    touchpad.disableWhileTyping = true;
  };
}
