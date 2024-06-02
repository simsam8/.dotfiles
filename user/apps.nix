
{pkgs, userSettings, ...}:

{
  home.packages = with pkgs; [ 
    stremio 
    spotify
    obsidian
    obs-studio
    (if userSettings.wm == "hyprland" then webcord-vencord else 
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
     }))
    libreoffice-qt
  ];
}
