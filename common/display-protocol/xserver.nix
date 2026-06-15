{pkgs,...}:
{
  services.xserver = {
    enable = true;
    xkb.layout = "tr";
    xkb.variant = "";
    displayManager.startx.enable = true;
  };

  console.keyMap = "trq";
  programs.dconf.enable = true;
}
