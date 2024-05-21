{ config, pkgs, inputs, systemSettings, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.simsam8 = {
      id = 0;
      name = "simsam8";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."${systemSettings.system}"; [
        bitwarden
        darkreader
        theme-nord-polar-night
        sidebery
      ];
    };
  };
}
