{pkgs, ...}:
let
  myAliases = {
    ll = "ls -la";
    ".." = "cd ..";
    nv = "nvim";
    jpl = "jupyter lab";
    nsc = "bash ~/scripts/devenv_creation.sh";
    nsa = "nix-shell shell.nix";
    tm = "tmux";
    gitig = "bash ~/scripts/git-ignore-template.sh";
    envc = "virtualenv venv";
    enva = "source venv/bin/activate";
    envd = "deactivate";
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

  imports = [
    ./oh-my-posh.nix
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };
}
