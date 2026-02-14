{
  config,
  pkgs,
  ...
}: {
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
      userName = "hacky";
      userEmail = "jon.nguyen7@protonmail.com";
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
    "helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/helix/";
      recursive = true;
    };
    "ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/ghostty/";
      recursive = true;
    };
    "dunst" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/dunst/";
      recursive = true;
    };
    "alacritty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/alacritty/";
      recursive = true;
    };
    "mango" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/mango/";
      recursive = true;
    };
    "nushell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/nushell/";
      recursive = true;
    };
    "rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/rofi/";
      recursive = true;
    };
    "waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/waybar/";
      recursive = true;
    };
    "hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/hypr/";
      recursive = true;
    };
  };
}
