{ pkgs, ... }: {

  imports = [ ../../../xserver.nix ];

  services.xserver = {
    windowManager.i3 = {
      package = pkgs.i3;
      enable = true;
      extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];
      configFile = ./config;
    };
  };
}
