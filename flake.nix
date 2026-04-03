{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix/release-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      catppuccin,
      hyprland,
      nixos-hardware,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      mkHost =
        {
          hostname,
          hardware,
          extraModules ? [ ],
          homePath,
        }:
        lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs system hostname;
          };

          modules = [
            ./configuration.nix
            ./noctalia.nix

            catppuccin.nixosModules.catppuccin
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager

            hardware
          ]
          ++ extraModules
          ++ [
            {
              home-manager = {
                useUserPackages = true;
                backupFileExtension = "backup";

                users.hacky.imports = [
                  catppuccin.homeModules.catppuccin
                  homePath
                ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        homie = mkHost {
          hostname = "homie";
          hardware = ./hosts/home/hardware-configuration.nix;
          homePath = ./hosts/home/home.nix;
        };

        work = mkHost {
          hostname = "workerbee";
          hardware = ./hosts/work/hardware-configuration.nix;
          homePath = ./hosts/work/home.nix;

          extraModules = [
            ./gpu/amd.nix
          ];
        };

        fwork = mkHost {
          hostname = "fWork";
          hardware = ./hosts/laptop/hardware-configuration.nix;
          homePath = ./hosts/laptop/home.nix;

          extraModules = [
            nixos-hardware.nixosModules.framework-16-7040-amd
          ];
        };
      };
    };
}
