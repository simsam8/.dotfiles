{pkgs, userSettings, ...}:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = "simsam8"; # TODO: change this to follow userSettings
    userEmail = userSettings.email;
    extraConfig = 
    {
      init.defaultBranch = "main"; 
      safe.directory = "/home/" + userSettings.username + "/.dotfiles/";
    };
  };
}
