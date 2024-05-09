
{pkgs, ...}:

{
  home.packages = with pkgs; [ 
    stremio 
    spotify
    obsidian
  ];
}
