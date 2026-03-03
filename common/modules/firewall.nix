{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 8008 8009 8010 7777 8080 ];
    allowedUDPPorts = [ 22 8008 8009 8010 7777 8080 ];
  };
}
