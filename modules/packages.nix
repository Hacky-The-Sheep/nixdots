{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ## General
    helix
    makemkv
    signal-desktop
    mullvad-vpn

    ## System
    git
    wget
    unzip
    usbutils
    ntfs3g
    exfat
    ffmpeg
    handbrake
    libdvdcss

    ## CLI
    eza
    fastfetch
    fd
    ripgrep
    rlwrap
    screen
    starship
    yazi
    yt-dlp
    ffuf
    gobuster
    nmap
    openvpn
    thc-hydra
    john

    ## Wayland / WM
    grim
    slurp
    wl-clipboard
    waybar
    swww
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
    nixfmt
    nixd
    any-nix-shell
    cargo
    rustc
    rustfmt
    rust-analyzer
    clippy
    go
    gopls
    delve
    python315
    ruff
    marksman
    markdown-oxide
    taplo
    yaml-language-server
    vscode-langservers-extracted
    carapace
    carapace-bridge

    ## Apps
    brave
    microsoft-edge
    remmina
    syncthing
    tailscale
    dnsutils
    openssl
    sshs
    fish
    powershell
    kdePackages.kwallet

    ## Media / Theming
    kdePackages.kdenlive
    material-cursors
    fluent-icon-theme
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
}
