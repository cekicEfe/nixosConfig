{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 22 8008 8009 8010 7777 8080 ];
    allowedUDPPorts = [ 80 443 22 8008 8009 8010 7777 8080 ];
  };
}
