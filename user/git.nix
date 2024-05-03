{pkgs, ...}:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = "simsam8";
    userEmail = "simvedaa@gmail.com";
    extraConfig = 
    {
      init.defaultBranch = "main"; 
      safe.directory = "/home/simsam/.dotfiles/";
    };
  };
}
