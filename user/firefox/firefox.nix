{ config, pkgs, inputs, systemSettings, userSettings, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.simsam8 = {
      id = 0;
      name = userSettings.username;
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."${systemSettings.system}"; [
        bitwarden
        darkreader
        theme-nord-polar-night
        sidebery
        ublock-origin
      ];
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.startup.page" = 3; # restore previous session
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.backdrop-filter.enabled" = true;
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
