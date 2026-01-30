{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };
  # without this boot partition fills up for some god forsaken reason
  boot.loader.grub.configurationLimit = 5;
}
