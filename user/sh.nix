{pkgs, ...}:
let
  myAliases = {
    ll = "ls -la";
    ".." = "cd ..";
    nv = "nvim";
    jpl = "jupyter lab";
    envs = "virtualenv venv";
    enva = "source venv/bin/activate";
    envd = "deactivate";
    tm = "tmux";
    gitig = "bash ~/scripts/git-ignore-template.sh";
  };
in
{
  home.packages = with pkgs; [
    gnugrep 
    fzf
    onefetch
    neofetch
    oh-my-posh
    nodePackages.bash-language-server
    direnv
    devenv
  ];

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "peru";
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };
}
