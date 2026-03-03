{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      attic-server
      attic-client
    ];
  networking.defaultGateway = {
    address = "192.168.1.109";
    interface = "eno1";
  };
}
