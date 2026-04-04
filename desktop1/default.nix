{
  imports = [
    ../common/packages.nix
    ../common/modules

    ../common/localTr.nix    
    ../common/nixSettings.nix

    ../common/display-protocol/window-managers/i3/fancy/i3.nix
    #../common/display-protocol/display-managers/sddm/sddm.nix
    #../common/display-protocol/desktop-managers/plasma6/plasma6.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix
    
    ../common/msp430-udev.nix
    ../common/kernelOptions
    ../common/users/users.nix

    ./extraConfig
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
