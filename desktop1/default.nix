{
  imports = [
    ../common/nixSettings.nix
    ../common/localTr.nix

    ../common/packages.nix
    ../common/modules

    ../common/users/users.nix

    ../common/display-protocol/window-managers/i3/fancy/i3.nix
    ../common/display-protocol/display-managers/sddm/sddm.nix
    ../common/display-protocol/desktop-managers/plasma6/plasma6.nix

    ../common/msp430-udev.nix
    ./extraConfig

    ../common/kernelOptions
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
