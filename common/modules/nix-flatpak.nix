{ pkgs, ... }:
let
  # Fetch nix-flatpak
  nix-flatpak = pkgs.fetchFromGitHub {
    owner = "gmodena";
    repo = "nix-flatpak";
    rev = "v0.6.0";
    hash = "sha256-0s3mpb28rcmma29vv884fi3as926bfszhn7v8n74bpnp5qg5a1c8";
  };
in {

  imports = [
    # Import the nix-flatpak NixOS module and install applications system wide.
    # HomeManager users should import `${nix-flatpak}/modules/home-manager.nix`
    # where appropriate.
    "${nix-flatpak}/modules/nixos.nix"
  ];
  # ... your config

  # Configure nix-flatpak
  services.nix-flatpak = {
    enable = true;
    packages = [ "org.usebottles.bottles" ];
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

}
