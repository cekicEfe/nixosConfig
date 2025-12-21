{ pkgs, lib, ... }: {

  imports = [ ../../../xserver.nix ];

  environment.etc."/xdg/i3status/config".text =
    builtins.readFile ./i3statusconfig;

  services.xserver = {
    windowManager.i3 = {
      package = pkgs.i3;
      enable = true;
      extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];

      configFile = ./config;
    };
  };
}
