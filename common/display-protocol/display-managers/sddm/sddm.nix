{
  imports = [ ../../xserver.nix ../../wayland.nix ];

  services.displayManager.defaultSession = "plasma6+i3";
  services.displayManager.sddm.enable = true;
}
