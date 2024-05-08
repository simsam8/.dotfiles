{

  description = "Flake of simsam8";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager-unstable.url = "github:nix-community/home-manager/master"; 
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, ... }@inputs:
  let
    systemSettings = {
      system = "x86_64-linux"; #system architecture
      hostname = "t480s"; # hostname
      profile = "personal"; # select a profile from my profiles dir (not implemented)
      timezone = "Europe/Oslo"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
    };

    userSettings = rec {
      username = "simsam";
      name = "Simon";
      email = "simvedaa@gmail.com";
      dotfilesDir = "~/.dotfiles";
      theme = "nord";
      wm = "hyprland"; 
      wmType = if (wm == "hyprland") then "wayland" else "x11";
      browser = "vivaldi"; # Default browser
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

    # pkgs = nixpkgs.legacyPackages.${systemSettings.system};
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
      system = lib.nixosSystem {
        system = systemSettings.system;
        # inherit system;
        specialArgs = { 
          inherit inputs;
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [ 
          ./configuration.nix
          # inputs.hyprland.nixosModules.default 
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
        modules = [ ./home.nix ];
      };
    };
  };

}
