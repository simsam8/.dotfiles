
{ pkgs, config, ...}:

{
  home.packages = [ pkgs.tmux ];
  home.file.".config/tmux/options".source = ./options;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-space";
    keyMode = "vi";
    mouse = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.nord
      tmuxPlugins.yank
    ];

    extraConfig = "
      # set-option -sa terminal-features ',alacritty:RGB' # change alacritty to the terminal you use, check `echo $TERM` outside tmux
      set-option -sa terminal-features ',xterm-256color:RGB' # change alacritty to the terminal you use, check `echo $TERM` outside tmux
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind '\"' split-window -v -c \"#{pane_current_path}\"
      bind % split-window -h -c \"#{pane_current_path}\"
      bind-key -r i run-shell \"tmux neww ~/scripts/tmux-cht.sh\"
      bind-key -r f run-shell \"tmux neww ~/scripts/tmux-sessionizer\"
    ";
  };
}
