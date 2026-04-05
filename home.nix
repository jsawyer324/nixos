{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";

  programs.git = {
    enable = true;
  };
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lah --color=auto";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#testnix01";
    };
  };

  home.stateVersion = "25.11";
}
