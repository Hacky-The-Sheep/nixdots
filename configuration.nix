{
  pkgs,
  # pkgs-unstable,
  hostname,
  ...
}:
{
  imports = [
    ./system/install.nix
  ];

  hardware = {
    bluetooth.enable = true;
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    firewall.trustedInterfaces = [ "tailscale0" ];
  };

  time.timeZone = "America/Chicago";

  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    gvfs.enable = true;
    upower.enable = true;
    libinput.enable = true;
    mullvad-vpn.enable = true;
    openssh.enable = true;
    resolved.enable = true;
    tailscale.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    soteria.enable = true;
  };

  users.users.hacky = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "dialout"
      "libvirtd"
      "lp"
      "networkmanager"
      "optical"
      "plugdev"
      "wheel"
    ];
    uid = 1000;
  };

  programs = {
    fish.enable = true;
    niri.enable = true;
    hyprland.enable = true;
    dconf.enable = true;
  };

  environment.systemPackages = (
    with pkgs;
    [
      ## General
      helix
      makemkv
      mullvad-vpn
      signal-desktop-bin

      ## System Tools
      exfat
      git
      handbrake
      libdvdcss
      ntfs3g
      pulseaudio
      usbutils
      grim
      slurp

      ## CLI Tools
      # btop
      eza
      fastfetch
      fd
      ffmpeg
      ffuf
      gobuster
      john
      nmap
      openvpn
      quickshell
      ripgrep
      rlwrap
      screen
      starship
      thc-hydra
      unzip
      wget
      yazi
      yt-dlp

      ## Work
      libreoffice
      wireshark

      ## WM Tools
      alsa-utils
      brightnessctl
      dunst
      grim
      networkmanager_dmenu
      # rofi
      slurp
      swww
      waybar
      wl-clipboard
      xwayland-satellite
      xdg-desktop-portal-wlr

      ## Entertainment
      kdePackages.kdenlive
      material-cursors
      fluent-icon-theme
      reversal-icon-theme
      tela-icon-theme

      ## GUI Tools
      gvfs
      gnome-disk-utility
      nautilus

      ## Coding and Formatters
      alejandra
      any-nix-shell
      carapace
      carapace-bridge
      cargo
      clippy
      delve
      go
      gopls
      marksman
      markdown-oxide
      nixd
      nixfmt
      openssl
      python315
      ruff
      rustfmt
      rust-analyzer
      rustc
      taplo
      vscode-langservers-extracted # Includes HTML/CSS/JSON/ESLINT
      yaml-language-server
      brave
      dnsutils
      fish
      powershell
      kdePackages.kwallet
      qbittorrent
      remmina
      sshs
      syncthing
      tailscale
    ]
  );

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    intel-one-mono
    iosevka-bin
    monaspace
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  system.stateVersion = "25.11";

  catppuccin = {
    enable = true;
    accent = "peach";
    cursors = {
      accent = "blue";
      enable = true;
      flavor = "mocha";
    };
  };

  nixpkgs.config.allowUnfree = true;
}
