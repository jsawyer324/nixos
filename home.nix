{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";

  home.file.".config/i3/config".source = ./config/i3/config;
  home.file.".config/polybar/config".source = ./config/polybar/config;
  # home.file.".config/kitty".source = ./config/kitty;

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
