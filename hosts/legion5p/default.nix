# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, userSettings, systemSettings, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../system
    ];

  environment.systemPackages = with pkgs; [
    lenovo-legion
    lm_sensors
    psensor
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    lenovo-legion-module
  ];

  boot.kernelModules = [
    "lenovo-legion-module"
  ];
  
  environment.variables.WLR_NO_HARDWARE_CURSORS = "1";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true; # Enable if there are issues

  hardware.nvidia.prime = {
    # sync.enable = true;

    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    # integrated
    intelBusId = "PCI:0:2:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0"; 
  };

  specialisation = {
    gaming-time.configuration = {
      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };

  # Bootloader.
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader.systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  boot.loader.grub.enable = if (systemSettings.bootMode == "uefi") then false else true;
  boot.loader.grub.device = systemSettings.grubDevice; # does nothing if running uefi rather than bios

  # Networking
  networking.hostName = "legion5p"; # Define your hostname.
  networking.networkmanager.enable = true; # Use network manager
  # networking.networkmanager.wifi.backend = "wpa_supplicant";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "23.11"; # Did you read the comment?


}
