{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8008 8009 8010 ];
    allowedUDPPortRanges = [{
      from = 8000;
      to = 8010;
    }];
  };
}
