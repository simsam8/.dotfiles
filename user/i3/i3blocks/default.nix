{ pkgs, config, ... }:

{
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars = {};
  };

  # home.file.".config/i3blocks/

  home.file.".config/i3blocks/scripts" = {
    source = ./scripts;
    recursive = true;
    force = true;
  };
}
