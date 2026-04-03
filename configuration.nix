{ hostname, ... }:

{
  imports = [
    ./system/install.nix
    ./modules/core.nix
    ./modules/services.nix
    ./modules/desktop.nix
    ./modules/user.nix
    ./modules/packages.nix
    ./modules/nix.nix
  ];

  networking.hostName = hostname;

  system.stateVersion = "25.11";
}
