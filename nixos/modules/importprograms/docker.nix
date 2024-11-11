{
  virtualisation.docker.enable = true;
  
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  virtualisation.docker.daemon.settings = {
    data-root = "/dockerFiles";
  };
}
