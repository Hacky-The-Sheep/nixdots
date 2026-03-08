{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../apps/install.nix
    ../../hosts/laptop/hyprmonitor.nix
    ../../system/ssh.nix
    ../../wm/hyprland.nix
    ../../wm/hyprlock.nix
  ];

  home = {
    username = "hacky";
    homeDirectory = "/home/hacky";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
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
    # monero-gui
    # obs-studio
    qFlipper
  ];

  xdg.configFile = {
    "helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/helix/";
      recursive = true;
    };
    "nushell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/nushell/";
      recursive = true;
    };
    "noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/noctalia/";
      recursive = true;
    };
  };
}
