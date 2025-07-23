{
  services.xserver = {
    desktopManager = {
      xterm.enable = true;
      xfce = {
        enableXfwm = true;
        noDesktop = true;
        enable = true;
      };
    };
  };
  services.libinput.mouse.middleEmulation = false;
}
