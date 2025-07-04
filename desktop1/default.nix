{
  imports = [
    ../common/packages.nix
    ../common/users/users.nix
    ../common/configuration.nix
    ../common/modules/bundle.nix
    ../common/display-protocol/window-managers/i3/i3.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix
    #../common/display-protocol/premade/premadeKde.nix

    ./extraConfig
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
