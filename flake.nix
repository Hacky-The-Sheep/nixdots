{
  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-25.11";
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # Let's go all unstable for now 3_13_26
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      # inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:/hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      catppuccin,
      home-manager,
      hyprland,
      nixos-hardware,
      nixpkgs,
      # nixpkgs-unstable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        ## HOME
        homie = lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            # inherit pkgs-unstable;
            inherit pkgs;
            inherit system;
            hostname = "homie";
          };
          modules = [
            ./configuration.nix
            ./noctalia.nix
            catppuccin.nixosModules.catppuccin
            ./hosts/home/hardware-configuration.nix
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.hacky = {
                  imports = [
                    catppuccin.homeModules.catppuccin
                    ./hosts/home/home.nix
                  ];
                };
              };
            }
          ];
        };

        ## work
        work = lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            # inherit pkgs-unstable;
            inherit pkgs;
            inherit system;
            hostname = "workerbee";
          };
          modules = [
            ./configuration.nix
            ./noctalia.nix
            catppuccin.nixosModules.catppuccin
            ./hosts/work/hardware-configuration.nix
            ./gpu/amd.nix
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.hacky = {
                  imports = [
                    catppuccin.homeModules.catppuccin
                    ./hosts/work/home.nix
                  ];
                };
              };
            }
          ];
        };

        ## Framework
        fwork = lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            # inherit pkgs-unstable;
            inherit pkgs;
            inherit system;
            hostname = "fWork";
          };
          modules = [
            ./configuration.nix
            ./noctalia.nix
            catppuccin.nixosModules.catppuccin
            ./hosts/laptop/hardware-configuration.nix
            nixos-hardware.nixosModules.framework-16-7040-amd
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.hacky = {
                  imports = [
                    catppuccin.homeModules.catppuccin
                    ./hosts/laptop/home.nix
                  ];
                };
              };
            }
          ];
        };
      };
    };
}
