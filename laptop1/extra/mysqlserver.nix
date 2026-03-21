{ pkgs, ... }: {
  services.mysql = {
    enable = true;
    package = pkgs.mysql80; # or pkgs.mariadb
    ensureDatabases = [ "mydatabase" ];
    ensureUsers = [{
      name = "nixy";
      ensurePermissions = { "mydatabase.*" = "ALL PRIVILEGES"; };
    }];
  };
}
