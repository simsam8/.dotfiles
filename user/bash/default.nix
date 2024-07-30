{ ... }:
let 
  myAliases = {
    ls = "ls --color=auto";
    ll = "ls -laF --color=auto";
    la = "ls -A --color=auto";
    l = "ls -CF --color=auto";
    ".." = "cd ..";
    nv = "nvim";
    jpl = "jupyter lab";
    tm = "tmux";
    gitig = "bash ~/scripts/git-ignore-template.sh";
    envc = "virtualenv venv";
    enva = "source venv/bin/activate";
    envd = "deactivate";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
  };
in
{
  programs.bash = {
    enable = true;
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
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./peru_nord.json);
  };
}
