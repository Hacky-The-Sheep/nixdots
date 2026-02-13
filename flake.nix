{
inputs = {
  nixpkgs.url = "nixpkgs/nixos-25.11"; 
  nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  mangowc = {
    url = "github:DreamMaoMao/mangowc";
    inputs.nixpkgs.follows = "nixpkgs-unstable";
  };
};

outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mangowc, ... }: {
  nixosConfigurations.homie = nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    mangowc.nixosModules.mango
    home-manager.nixosModules.home-manager
  {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.hacky = import ./home.nix;
    backupFileExtension = "backup";
  };
  }
];
};
};
}
