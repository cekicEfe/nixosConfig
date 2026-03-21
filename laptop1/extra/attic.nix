{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      attic-server
      attic-client
    ];
}
