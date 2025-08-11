{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8008 8009 8010 7777 ];
    allowedUDPPortRanges = [{
      from = 7000;
      to = 8010;
    }];
  };
}
