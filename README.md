# .dotfiles

update flake.lock -> nix flake update

rebuild system -> sudo nixos-rebuild switch --flake .#optional_config_name

rebuild home manager -> home-manager switch flake .#optional_config_name
