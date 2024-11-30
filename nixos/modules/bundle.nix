{
	imports = 
	[
		./importprograms/importprograms.nix
		./audio/audio.nix
		./bluetooth/bluetooth.nix
		./virtmanager/virtmanager.nix
		./nwmanager/nwmanager.nix

		./trim/trim.nix

		./firewall/firewall.nix
		./deamons/logind.nix
      ];
}
