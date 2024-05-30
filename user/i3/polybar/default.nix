{ pkgs, config, userSettings, ... }:
let
  palette = config.colorScheme.colors;
in
{
  imports = [
    ./colors.nix
    ./modules.nix
    ./bars.nix
  ];

  # home.file.".config/polybar/launch.sh" = {
  #   source = ./launch.sh;
  #   force = true;
  # };
  #
  # home.file.".config/polybar/brightnessctl.sh" = {
  #   source = ./brightnessctl.sh;
  #   force = true;
  # };

  home.file.".config/polybar/scripts" = {
    source = ./scripts;
    force = true;
    recursive = true;
  };

  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    };

    script = ''
    '';

    settings = {

      "global/wm" = {
        margin-bottom = 1;
        margin-top = 1;
      };
      "colors" = {
        background = palette.base00;
        background-alt = palette.base01;
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = false;
      };
    };
  };
}
