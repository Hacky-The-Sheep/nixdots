{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../system/ssh.nix
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
    xmrig
    qFlipper
  ];

  xdg.configFile = {
    "btop" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/btop/";
      recursive = true;
    };
    "dunst" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/dunst/";
      recursive = true;
    };
    "ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/ghostty/";
      recursive = true;
    };
    "noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/noctalia/";
      recursive = true;
    };
    "helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/config/helix/";
      recursive = true;
    };
    "mango" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/hacky/nixdots/hosts/work/mango/";
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
