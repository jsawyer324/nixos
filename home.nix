{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
}
