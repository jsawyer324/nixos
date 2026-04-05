{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hosts/qemu-vm.nix
      ./modules/users
      ./modules/packages
      ./modules/git
      ./modules/qemu

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
    desktopManager.xfce.enable = true;
  };

  

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
