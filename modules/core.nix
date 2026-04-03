{ pkgs, ... }:

{
  ## Hardware
  hardware.bluetooth.enable = true;

  ## Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  ## Time
  time.timeZone = "America/Chicago";

  ## Networking
  networking = {
    networkmanager.enable = true;
    firewall.trustedInterfaces = [ "tailscale0" ];
  };

  ## Security
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    soteria.enable = true;
  };
}
