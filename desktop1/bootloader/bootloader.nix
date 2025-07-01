{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "/boot";
    };
    efi.canTouchEfiVariables = true;
  };
}
