{pkgs,...}: 
let 
  options = import ../../options.nix;
in{

  imports = 
  [
    ../xserver/xserver.nix
  ];

  services.displayManager.sddm.enable = true;

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    eww
    dunst
    libnotify
    
    hyprpaper
    
    swaybg
    wpaperd
    mpvpaper
    swww

    kitty

    ##app launcher
    rofi-wayland

  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
