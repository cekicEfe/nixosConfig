{
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enableXfwm = false;
        noDesktop = true;
        enable = true;
      };
    };
  };
}
