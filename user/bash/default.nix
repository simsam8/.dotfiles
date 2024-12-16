{ systemSettings, ... }:
let 
  profile = systemSettings.profile;
  myAliases = {
    ls = "ls --color=auto";
    ll = "ls -laF --color=auto";
    la = "ls -A --color=auto";
    l = "ls -CF --color=auto";
    ".." = "cd ..";
    nv = "nvim";
    jpl = "jupyter lab";
    tm = "tmux";
    tms = "~/scripts/tmux-sessionizer";
    gitig = "bash ~/scripts/git-ignore-template.sh";
    envc = "virtualenv venv";
    enva = "source venv/bin/activate";
    envd = "deactivate";
    # nsc = "bash ~/scripts/devenv_creation.sh";
    # nsa = "nix-shell shell.nix";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
  };
in
{
  home.file.".bash_aliases".source = ./.bash_aliases;
  home.file.".bashrc_extension".source = ./.bashrc_extension;

  programs.bash = {
    enable = if profile == "non-nixos" then false else true;
    shellAliases = myAliases;
    historySize = 1000;
    historyFileSize = 2000;

    bashrcExtra = ''

    '';
    initExtra = ''
      # include .profile if it exists
      [[ -f ~/.profile ]] && . ~/.profile
    '';
  };

  programs.oh-my-posh = {
    enable = if profile == "non-nixos" then false else true;
    settings = builtins.fromJSON (builtins.readFile ./peru_nord.json);
  };

}
