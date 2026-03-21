{ pkgs, ... }: {
  imports = [ ./flatpak.nix ./guix.nix ./steam.nix ./attic.nix ./mysqlserver.nix];
}
