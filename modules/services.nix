{
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
}
