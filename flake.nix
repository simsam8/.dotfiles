{

  description = "Flake of simsam8";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";

    home-manager-unstable.url = "github:nix-community/home-manager/master"; 
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    nix-colors.url = "github:misterio77/nix-colors";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
  let
    systemSettings = {
      system = "x86_64-linux"; #system architecture
      hostname = "legion5p"; # hostname
      profile = "non-nixos"; # select a profile from profiles dir
      nvidia = true; # system has nvidia gpu
      timezone = "Europe/Oslo"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
    };

    userSettings = rec {
      username = "simsam8"; # current user and username for git
      name = "Simon";
      email = "simvedaa@gmail.com"; # used for setting up git
      dotfilesDir = "~/.dotfiles";
      theme = "nord";
      # wm = "hyprland"; 
      wm = "i3";
      wmType = if (wm == "hyprland") then "wayland" else "x11";
      browser = "firefox"; # Default browser
      term = "alacritty"; # Default terminal command
      font = "RobotoMono"; # Selected font
      fontPkg = pkgs.roboto-mono; # Font package
      editor = "nvim"; # Default editor
      spawnEditor = if ((editor == "vim") ||
                        (editor == "nvim") ||
                        (editor == "nano")) then
                          "exec " + term + " -e " + editor
                    else
                      editor;

    };

    pkgs = import inputs.nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };
    
    pkgs-stable = import inputs.nixpkgs-stable {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

    lib = inputs.nixpkgs.lib;

    home-manager = inputs.home-manager-unstable;

  in {
    nixosConfigurations = {
      t480s = lib.nixosSystem {
        system = systemSettings.system;
        # inherit system;
        specialArgs = { 
          inherit inputs;
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [ 
          ./hosts/t480s
        ];
      };
      
      legion5p = lib.nixosSystem {
        system = systemSettings.system;
        specialArgs = {
           inherit inputs;
           inherit pkgs-stable;
           inherit systemSettings;
           inherit userSettings;
          };
          modules = [ 
            ./hosts/legion5p
          ];
        };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { 
          inherit inputs;
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [ ./profiles/${systemSettings.profile}/home.nix ];
      };
    };
  };

}
