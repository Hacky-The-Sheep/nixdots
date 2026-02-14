{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    nixpkgs,
    catppuccin,
    nixpkgs-unstable,
    home-manager,
    mangowc,
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
    };
  };
}
