{ ... }:

{
  services.autorandr.enable = true;
  programs.autorandr.enable = true;

  home.file.".config/autorandr/" = {
    source = ./profiles;
    recursive = true;
  };
}
