{pkgs, ... }:{
  
  imports = [
    ../../xserver.nix
  ];

  services.xserver = {
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

    # services.picom = {
    #   enable = true;
    #   fade = true;
    #   vSync = true;
    #   shadow = true;
    #   fadeDelta = 4 ;
    #   inactiveOpacity = 0.8;
    #   activeOpacity = 1;
    #   backend = "glx"; 
    #   settings = {
    #     blur = {
    #  	method = "dual_kawase";
    #    	background = true;
    #    	strength = 5;
    #     };
    #   };
    # };
}
