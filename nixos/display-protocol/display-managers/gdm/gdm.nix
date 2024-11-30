{
  imports = [
    ../../xserver.nix
    ../../wayland.nix
  ];
  services.xserver.displayManager.gdm.enable = true;
}
