# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, userSettings, systemSettings, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/time.nix
      ./hardware/printing.nix
      ./hardware/bluetooth.nix
      ./hardware/power.nix
      (./wm + ("/" + userSettings.wm) + ".nix") # Window manager
    ];

  # User account 
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" ];
    packages = [ pkgs.vivaldi ];
  };
  
  # Ensure nix flakes are enabled
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [

  ];

  services.xserver.wacom.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  # Use systemd-boot if uefi, default to grub otherwise
  # boot.loader.systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  # boot.loader.efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  # boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  # boot.loader.grub.enable = if (systemSettings.bootMode == "uefi") then false else true;
  # boot.loader.grub.device = systemSettings.grubDevice; # does nothing if running uefi rather than bios


  # Timezone and locale

  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };



  # System packages
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    git
    wget
    home-manager
    clang
    unzip
    python3
    nodejs_22
    lua-language-server
    nil
    xf86_input_wacom # wacom tablet
  ];


  fonts.fontDir.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?


}
