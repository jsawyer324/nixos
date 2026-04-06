{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";

  # home.file.".config/i3".source = ./config/i3;
  home.file.".config/polybar".source = ./config/polybar;
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
