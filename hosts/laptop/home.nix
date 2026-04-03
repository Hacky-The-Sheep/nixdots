{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixdots/config";

  mkLink = name: {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
    recursive = true;
  };
in
{
  imports = [
    ../../apps/install.nix
    ../../system/ssh.nix
    ../../wm/hyprland.nix
    ../../wm/hyprlock.nix
    ../../hosts/laptop/hyprmonitor.nix
  ];

  home = {
    username = "hacky";
    homeDirectory = "/home/hacky";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
  };

  nixpkgs.config.allowUnfree = true;

  gtk = {
    enable = true;
    colorScheme = "dark";

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "peach";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      settings = {
        user.name = "hacky";
        user.email = "jon.nguyen7@protonmail.com";
      };
    };
  };

  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    ## Secrets
    gcr

    ## Apps
    qFlipper
    qbittorrent
  ];

  xdg.configFile = {
    helix = mkLink "helix";
    niri = mkLink "niri";
    nushell = mkLink "nushell";
    noctalia = mkLink "noctalia";
  };
}
