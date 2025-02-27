{ pkgs, ... }: {
  imports = [ ../wayland.nix ../xserver.nix ];
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [ kdePackages.krohnkite ];
}
