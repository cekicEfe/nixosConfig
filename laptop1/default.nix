{
  imports = [
    ../common/packages.nix
    ../common/modules

    #../common/configuration.nix
    ../common/localTr.nix
    ../common/nixSettings.nix

    ../common/display-protocol/window-managers/i3/fancy/i3.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix

    ../common/users/users.nix

    ../common/msp430-udev.nix
    ./extra/extra.nix
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
