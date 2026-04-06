{config, pkgs, lib, ...}:

{
  imports = [
    #../hardware/sound.nix
    #../hardware/bluetooth.nix
    #../general
    #../file/thunar.nix
  ];

  services = {
    
    displayManager.defaultSession = "none+i3";
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      desktopManager.xterm.enable = false;
      displayManager.lightdm = {
        enable = true;
        background = "#000000";
        greeters.gtk.extraConfig = ''user-background = false'';
      };
      windowManager.i3.enable = true;
    };
  };

  environment = {
    
    extraInit = ''xset s off -dpms'';
    
    sessionVariables = {
      TERM = "kitty";
      TERMINAL = "kitty";
    };
    
    systemPackages = with pkgs; [
      polybarFull
      dmenu
      rofi
      i3status
      i3lock
      picom
      ranger
      lf
      pavucontrol
      mpd
      killall
      kitty
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    siji
    unifont
    ubuntu-classic
    texlivePackages.dejavu-otf 
    freefont_ttf
    liberation_ttf 
    roboto 
    terminus_font_ttf
    xorg.fontbhttf
  ];

  systemd.user.services.polybar.enable = true;

}