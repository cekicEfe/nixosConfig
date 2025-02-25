{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      splashImage = ./linusFlipBird.jpeg;
    };
    efi.canTouchEfiVariables = true;
  };
}
