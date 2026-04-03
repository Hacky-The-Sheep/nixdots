{ pkgs, hostname, ... }:

{
  imports = [
    ./system/install.nix
  ];

  hardware.bluetooth.enable = true;

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
    tailscale.enable = true;
    openssh.enable = true;
    resolved.enable = true;

    displayManager.ly.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    soteria.enable = true;
  };

  ## --- User ---
  users.users.hacky = {
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.nushell;

    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "dialout"
      "plugdev"
      "lp"
      "optical"
    ];
  };

  ## --- Programs ---
  programs = {
    fish.enable = true;
    hyprland.enable = true;
    niri.enable = true;
    dconf.enable = true;
  };

  ## --- Packages ---
  environment.systemPackages = with pkgs; [
    ## General
    helix
    makemkv
    mullvad-vpn
    signal-desktop

    ## System
    exfat
    ffmpeg
    git
    handbrake
    libdvdcss
    ntfs3g
    unzip
    usbutils
    wget

    ## CLI
    eza
    fastfetch
    fd
    ffuf
    gobuster
    john
    nmap
    openvpn
    ripgrep
    rlwrap
    screen
    starship
    thc-hydra
    yazi
    yt-dlp

    ## WM / Wayland
    grim
    slurp
    wl-clipboard
    waybar
    brightnessctl
    alsa-utils
    dunst
    networkmanager_dmenu
    xdg-desktop-portal-wlr
    xwayland-satellite

    ## GUI
    nautilus
    gnome-disk-utility
    gvfs

    ## Work
    libreoffice
    wireshark

    ## Dev
    alejandra
    any-nix-shell
    carapace
    carapace-bridge
    cargo
    clippy
    delve
    go
    gopls
    markdown-oxide
    marksman
    nixd
    nixfmt
    python315
    ruff
    rust-analyzer
    rustc
    rustfmt
    taplo
    vscode-langservers-extracted
    yaml-language-server

    ## Apps
    brave
    dnsutils
    fish
    kdePackages.kwallet
    microsoft-edge
    openssl
    powershell
    remmina
    sshs
    syncthing
    tailscale

    ## Media / Theming
    fluent-icon-theme
    kdePackages.kdenlive
    material-cursors
    reversal-icon-theme
    tela-icon-theme
  ];

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

  catppuccin = {
    enable = true;
    accent = "peach";

    cursors = {
      enable = true;
      flavor = "mocha";
      accent = "blue";
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
