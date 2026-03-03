{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      attic-server
      attic-client
    ];
  # networking.defaultGateway = {
    # address = "192.168.111.1";
    # interface = "eno1";
  # };
}
