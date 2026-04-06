{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hosts/qemu-vm.nix
      ./modules/users
      ./modules/packages
      ./modules/qemu
      ./modules/de/i3.nix

    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "testnix01";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
