
{pkgs, ...}:

{
  home.packages = with pkgs; [ 
    stremio 
    spotify
    obsidian
    obs-studio
    # webcord-vencord
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
     })
    libreoffice-qt
  ];
}
