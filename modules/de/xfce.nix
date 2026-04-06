{config, pkgs, lib, ...}:

{
  imports = [
    # ../hardware/sound.nix
  ];
  
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

}