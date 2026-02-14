{
  pkgs,
  pkgs-unstable,
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
    hostName = "homie";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    mullvad-vpn.enable = true;
    resolved.enable = true;
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
      dunst
      grim
      hyprlock
      rofi
      slurp
      swww
      waybar
      wl-clipboard
      xdg-desktop-portal-wlr

      ## Entertainment
      kdePackages.kdenlive

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
