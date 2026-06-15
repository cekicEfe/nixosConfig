{pkgs,...}:{

  environment.systemPackages = [
    pkgs.emacsPackages.exwm
    pkgs.emacsPackages.vterm
    pkgs.emacsPackages.use-package   
  ];
  
  services.xserver = {
      windowManager.exwm = {
      enable = true;
      extraPackages = epkgs: [ epkgs.vterm epkgs.use-package ];
    };
    displayManager.defaultSession = "none+exwm";
  };
}
