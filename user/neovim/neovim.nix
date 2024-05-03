{ pkgs, config, ...}:

{
  home.packages = [ pkgs.neovim ];

  home.file.".config/nvim" = 
  {
    source = ./nvchad;
    recursive = true;
    force = true;
  };
}
