{
  pkgs,
  pkgs-unstable,
  hostname,
  ...
}: {
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
    firewall.trustedInterfaces = ["tailscale0"];
  };

  time.timeZone = "America/Chicago";

  services = {
    displayManager.ly.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    flatpak.enable = true;
    gvfs.enable = true;
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
      "networkmanager"
      "wheel"
      "plugdev"
      "dialout"
      "libvirtd"
      "lp"
    ];
    uid = 1000;
  };

  programs = {
    mango.enable = true;
    dconf.enable = true;
  };

  environment.systemPackages =
    (with pkgs; [
      ## General
      foot
      ghostty
      helix
      mullvad-vpn
      signal-desktop-bin

      ## System Tools
      exfat
      git
      ntfs3g
      pulseaudio
      usbutils

      ## CLI Tools
      btop
      fd
      ffmpeg
      ffuf
      gobuster
      john
      nmap
      openvpn
      ripgrep
      rlwrap
      screen
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
      hyprlock
      networkmanager_dmenu
      rofi
      slurp
      swww
      waybar
      wl-clipboard
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
      rust-analyzer
      rustc
      vscode-langservers-extracted # Includes HTML/CSS/JSON/ESLINT
      yaml-language-server
    ])
    ++ (with pkgs-unstable; [
      brave
      dnsutils
      hyprlock
      powershell
      qbittorrent
      remmina
      sshs
      syncthing
      tailscale
    ]);

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    intel-one-mono
    iosevka-bin
    monaspace
  ];

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  system.stateVersion = "25.11";
}
