{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../system/ssh.nix
    ../../apps/install.nix
    ../../wm/hyprland.nix
    ../../wm/hyprlock.nix
    ../../hosts/home/hyprmonitor.nix
  ];

  home = {
    username = "hacky";
    homeDirectory = "/home/hacky";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "hacky";
        user.email = "jon.nguyen7@protonmail.com";
      };
    };
    home-manager.enable = true;
  };

  services = {
    gnome-keyring.enable = true;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "peach";
  };

  home.packages = with pkgs; [
    ## Secrets
    gcr

    ## Main
    pandoc

    ## Junk
    # discord
    monero-gui
    obs-studio
    qFlipper
  ];

  xdg.configFile = {
    "noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/noctalia/";
      recursive = true;
    };
    "nushell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/nushell/";
      recursive = true;
    };
    "helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/helix/";
      recursive = true;
    };
    "niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/niri/";
      recursive = true;
    };
  };
}
