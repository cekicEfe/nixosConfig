{ pkgs, ... }: {
  environment.systemPackages = [
    #
    pkgs.gnomeExtensions.dock-from-dash
  ];
  services.xserver.desktopManager.gnome.enable = true;
}
