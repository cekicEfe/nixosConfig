{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      53 # For Cups
      631 # For Cups
      5353 # For Cups
      
      80
      443
      22
      8008
      8009
      8010
      7777
      8080
      1119
      6112
      6113
      6114
      28890
      28891
      28892
      28893
      54545
      54546
      54547
      54548
      54549
      27015
      27036
      5291
    ];
    allowedUDPPorts = [
      53 # For Cups
      137 # For Cups
      139 # For Cups
      445 # For Cups
      
      80
      443
      22
      8008
      8009
      8010
      7777
      8080
      1119
      6120
      27015
      27031
      27032
      27033
      27034
      27035
      27036
      5291
    ];
  };
}
