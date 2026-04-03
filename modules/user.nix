{ pkgs, ... }:

{
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
}
