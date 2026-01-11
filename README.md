# .dotfiles

Personal dotfiles and configuration for my Linux setup running on Omarchy.

## General setup

Using stow to manage dotfiles.

```bash
stow <folder>
```

## Hyprland


This is to avoid overwrites of keybinds when updating omarchy.
For bindings add ```source = ~/.config/hypr/new_bindings.conf``` in ```~/.config/hypr/hyprland.conf```.


## Eduroam setup on Arch Linux

Get installers from [here](https://cat.eduroam.org/)

If multiple network daemons are running, such as systemd-networkd and NetworkManager, disable the one you don't use.
Use this [thread](https://bbs.archlinux.org/viewtopic.php?id=282947) to resoleve any issues.


## Packages (TODO: add as install script)

- yt-dlp
- qutebrowser
- zotero
- vesktop
- tmux
- texpresso-git
- texlive-latexrecommended
- texlive-latex
- texlive-fontsrecommended
- texlive-fontsextra
- texlive-basic
- stow
- python-adblock
- pandoc-cli
- nvtop
- btop
- guitarix
- dbeaver
- bitwarden
- rbw
