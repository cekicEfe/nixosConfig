{pkgs,...}:
{
  imports = 
  [
    ../../xserver.nix
  ];

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

    rofi-wayland
  ];

  #xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
