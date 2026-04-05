{config, pkgs, lib, ...}:

{
  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "James Sawyer";
      user.email = "jsawyer324@gmail.com";
    };
  };
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    nano
    alacritty
    obsidian
    _1password-cli
    _1password-gui
    pianobar
    session-desktop
    vlc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}