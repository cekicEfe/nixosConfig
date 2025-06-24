{
  imports = [
    ../common/packages.nix
    ../common/users/users.nix
    ../common/configuration.nix
    ../common/modules/bundle.nix
    ../common/display-protocol/premade/premadeKde.nix

    ./extraConfig/extraConfig.nix
    ./bootloader/bootloader.nix
    ./hardware-configuration.nix
  ];
}
