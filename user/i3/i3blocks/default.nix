{ pkgs, config, ... }:

{
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars = {};
  };
}
