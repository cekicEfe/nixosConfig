{ config, pkgs, ... }:{
  services.xserver = {
  enable = true;
    xkb.layout = "tr";
    xkb.variant = "";

    desktopManager = {
      xterm.enable=false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager = {
      defaultSession = "xfce+i3";
    };

    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
	i3lock
	i3blocks
      ];
      configFile = ./config;
    };
  };

  console.keyMap = "trq";
  programs.dconf.enable = true;

  services.picom = {
    enable = true;
    fade = true;
    vSync = true;
    shadow = true;
    fadeDelta = 4 ;
    inactiveOpacity = 0.8;
    activeOpacity = 1;
    backend = "glx";
    
    settings = {
      corner-radius = 15;
      blur = {
	method = "dual_kawase";
	background = true;
	strength = 5;
      };
    };
  };
}
