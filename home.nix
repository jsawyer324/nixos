{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";
  
  programs.git = {
    enable = true;
    config = {
      user.name = "James Sawyer";
      user.email = "jsawyer324@gmail.com";
    };
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
