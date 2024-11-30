{
  imports = [
    ../../xserver.nix
    ../../wayland.nix
  ];

  services.displayManager.sddm.enable = true;
}
