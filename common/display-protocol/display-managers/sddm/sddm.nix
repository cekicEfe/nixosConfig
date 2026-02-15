{
  imports = [ ../../xserver.nix ../../wayland.nix ];

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.compositor = "kwin";
}
