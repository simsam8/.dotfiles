#!/usr/bin/env bash

dotfiles_dir=~/.dotfiles
config_dir=~/.config
home=~/

config_files=("tmux")
home_files=("bin" ".gitconfig" ".bash/.bash_aliases")


echo "Creating symlinks in $config_dir directory"
for file in "${config_files[@]}"
do
  echo "$file"
  ln -s $dotfiles_dir/$file $config_dir
done
echo "...done"
echo

echo "Creating symlinks in $home directory"
for file in "${home_files[@]}"
do
  echo "$file"
  ln -s $dotfiles_dir/$file $home
done
echo "...done"
echo
