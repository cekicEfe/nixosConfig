{
  imports = [
    #./nix-flatpak.nix
    ./docker.nix
    ./audio.nix
    ./bluetooth.nix
    ./virtmanager.nix
    ./nwmanager.nix
    ./powerManager.nix
    ./trim.nix
    ./firejail.nix
    ./firewall.nix
    ./deamons/logind.nix
  ];
}
