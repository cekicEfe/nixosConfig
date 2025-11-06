{
  imports = [
    ../common/configuration.nix

    ../common/packages.nix
    ../common/modules

    ../common/users/users.nix

    ../common/display-protocol/window-managers/i3/normal/i3.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix
    #../common/display-protocol/premade/premadeKde.nix

    ./extraConfig

    ../common/kernelOptions
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
