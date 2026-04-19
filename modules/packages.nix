{ pkgs, ... }:

{
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
    thc-hydra
    yazi
    yt-dlp

    ## Wayland / WM
    alsa-utils
    brightnessctl
    dunst
    grim
    networkmanager_dmenu
    slurp
    wl-clipboard
    xdg-desktop-portal-wlr
    xwayland-satellite

    ## GUI
    gnome-disk-utility
    gvfs
    nautilus

    ## Work
    libreoffice
    onlyoffice-desktopeditors
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
    kdePackages.kdenlive
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    intel-one-mono
    iosevka-bin
    monaspace
  ];
}
