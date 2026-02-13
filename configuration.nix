{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  hardware = {
    bluetooth.enable = true;
  };
  
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "homie";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services = {
    # displayManager.ly.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
  };

  users.users.hacky = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    brave
    waybar
    foot
    rofi
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
    firefox
    ghostty
    git
    vim
    wget
    helix
   ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}

