{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hosts/qemu-vm.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "testnix01";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
  };

  users.users.james = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$M5BabIW6pI/pvv4S8Iw3w1$0Bw84D2PmB6enz15qyTNt5VeHfhzhJ3JsQ5CE0gcrOD";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  users.users.root = {
    hashedPassword = "$y$j9T$abktyaspdhcRsi53hqJR0/$jHPD6ekeQ85IzM84dXWGAhAA7kghWM4qQaY7B.SltL3";
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
