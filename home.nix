{ config, pkgs, ... }:

{
  home = {
    username = "hacky";
    homeDirectory = "/home/hacky";
    stateVersion = "25.11";
  };

  programs = {
    git.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        tt = "testing minimal install";
      };
    };
  };
}
