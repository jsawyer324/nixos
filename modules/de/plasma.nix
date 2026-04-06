{config, pkgs, lib, ...}:


{
  imports = [
    # ../hardware/sound.nix
  ];
  
  services.xserver = {
    enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}