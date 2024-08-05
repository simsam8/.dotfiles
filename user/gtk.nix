{ pkgs, config, systemSettings, ... }:

{
  home.packages = with pkgs; [
    nordic
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 16;
  };

  gtk = if systemSettings.profile == "non-nixos" then {} else {
    enable = true;
    iconTheme = {
      name = "Nordzy";
      package = pkgs.nordzy-icon-theme;
    };
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
    gtk2 = {
      configLocation = "${config.home.homeDirectory}/.gtkrc-2.0";
    };
  };

  dconf.settings = if systemSettings.profile == "non-nixos" then {} else {
    "org/gnome/desktop/interface" = {
      gtk-theme = "${config.gtk.theme.name}";
      cursor-theme = "${config.gtk.cursorTheme.name}";
    };
  };
}
