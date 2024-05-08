{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Fonts
    roboto-mono
    (pkgs.nerdfonts.override { fonts = [ "RobotoMono" ]; })
    ubuntu_font_family
  ];
}
