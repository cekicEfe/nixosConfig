{ config, lib, pkgs, nixpkgs-stable , ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  
  hardware.graphics = { enable = true; };
  
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.initrd.kernelModules = [ "nvidia" ];

  boot.kernelModules = [
  "nvidia"
  "nvidia_modeset"
  "nvidia_uvm"
  "nvidia_drm"
  ];
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
