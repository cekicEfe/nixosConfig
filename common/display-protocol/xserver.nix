{pkgs,...}:
{
  services.xserver = {
    enable = true;
    xkb.layout = "tr";
    xkb.variant = "";
  };

  console.keyMap = "trq";
  programs.dconf.enable = true;
}
