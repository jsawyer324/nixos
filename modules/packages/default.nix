{config, pkgs, lib, ...}:

{
  programs.firefox.enable = true;

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