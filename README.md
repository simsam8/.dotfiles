# .dotfiles

update flake.lock -> nix flake update

rebuild system -> sudo nixos-rebuild switch --flake .#optional_config_name

rebuild home manager -> home-manager switch flake .#optional_config_name


## Notes

Makes sure to uncomment mason in [plugins folder](./user/neovim/nvchad/lua/plugins/init.lua)
on non-nixos systems to install language servers.
