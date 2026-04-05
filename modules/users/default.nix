{config, pkgs, lib, ...}:

{
  users.users.james = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$M5BabIW6pI/pvv4S8Iw3w1$0Bw84D2PmB6enz15qyTNt5VeHfhzhJ3JsQ5CE0gcrOD";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  users.users.root = {
    initialHashedPassword = "$y$j9T$abktyaspdhcRsi53hqJR0/$jHPD6ekeQ85IzM84dXWGAhAA7kghWM4qQaY7B.SltL3";
  };
}