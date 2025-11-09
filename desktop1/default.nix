{
  imports = [
    ../common/nixSettings.nix
    ../common/localTr.nix

    ../common/packages.nix
    ../common/modules

    ../common/users/users.nix

    ../common/display-protocol/window-managers/i3/fancy/i3.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix

    ./extraConfig

    ../common/kernelOptions
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
