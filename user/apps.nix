
{pkgs, ...}:

{
  home.packages = with pkgs; [ 
    stremio 
    spotify
    obsidian
    obs-studio
    webcord-vencord
    hyprshot
  ];
}
