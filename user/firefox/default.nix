{ config, pkgs, inputs, systemSettings, userSettings, ... }:

{
  imports = [ ./firefox.nix ];

  home.file.".mozilla/firefox/${userSettings.username}/chrome" = {
    source = ./blurredfox-master;
    recursive = true;
    force = true;
  };
}
