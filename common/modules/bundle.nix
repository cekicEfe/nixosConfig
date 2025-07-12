{
  imports = [
    ./importprograms
    ./audio/audio.nix
    ./bluetooth/bluetooth.nix
    ./virtmanager/virtmanager.nix
    ./nwmanager/nwmanager.nix
    ./powerManager
    ./trim/trim.nix

    ./firewall/firewall.nix
    ./deamons/logind.nix
  ];
}
