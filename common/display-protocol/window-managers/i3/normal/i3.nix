{ pkgs, lib,config , used_terminal ... }:
let
  myI3Config = builtins.replaceStrings [ "$term" ] 
    [ (if used_terminal == "kitty" then "kitty" else "alacritty") ] 
    (builtins.readFile ./config);
in
{
  imports = [ ../../../xserver.nix ];

  environment.etc."/xdg/i3status/config".text =
    builtins.replaceStrings [ "$term" ]
    [ (if used_terminal == "kitty" then "kitty" else "alacritty") ]
    (builtins.readFile ./i3statusconfig);

  services.xserver = {
    windowManager.i3 = {
      package = pkgs.i3;
      enable = true;
      extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];
      configFile = pkgs.writeText "i3-config" myI3Config;
    };
  };
}
