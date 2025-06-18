{
  imports = [
    ../../wayland.nix
    ../../xserver.nix
  ];

  services.xserver.displayManager = { 
  lightdm = { 
    enable = true; 
    }; 
  }; 
}
