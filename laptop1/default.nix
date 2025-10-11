{
  imports = [
    ../common/packages.nix
    ../common/users/users.nix
    ../common/configuration.nix
    ../common/modules
    ../common/display-protocol/window-managers/i3/i3.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix

    ./extra.nix
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
