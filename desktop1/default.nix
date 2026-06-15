{
  imports = [
    ../common/packages.nix
    ../common/modules

    
    ./extraConfig/steam.nix
    
    
    ../common/localTr.nix    
    ../common/nixSettings.nix


    ../common/display-protocol/xserver.nix
    ../common/display-protocol/display-managers/lightdm/lightdm.nix
    ../common/display-protocol/desktop-managers/xfce4/xfce4.nix
    ../common/display-protocol/window-managers/i3/fancy/i3.nix

    
    ../common/users/users.nix

    
    ../common/msp430-udev.nix
    ../common/kernelOptions   
    ./extraConfig/nvidia.nix
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
