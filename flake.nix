{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    catppuccin,
    home-manager,
    mangowc,
    nixos-hardware,
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs-unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      ## HOME
      homie = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
          inherit system;
          hostname = "homie";
        };
        modules = [
          ./configuration.nix
          ./noctalia.nix
          catppuccin.nixosModules.catppuccin
          ./hosts/home/hardware-configuration.nix
          mangowc.nixosModules.mango
          home-manager.nixosModules.home-manager
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
          inherit pkgs-unstable;
          inherit system;
          hostname = "workerbee";
        };
        modules = [
          ./configuration.nix
          ./noctalia.nix
          catppuccin.nixosModules.catppuccin
          ./hosts/work/hardware-configuration.nix
          mangowc.nixosModules.mango
          home-manager.nixosModules.home-manager
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
          inherit pkgs-unstable;
          inherit system;
          hostname = "fWork";
        };
        modules = [
          ./configuration.nix
          ./noctalia.nix
          catppuccin.nixosModules.catppuccin
          ./hosts/laptop/hardware-configuration.nix
          nixos-hardware.nixosModules.framework-16-7040-amd
          mangowc.nixosModules.mango
          home-manager.nixosModules.home-manager
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
