{ config, pkgs, ... }:
{
	services.udisks2.enable = true;
	users.users.nixy = {
                isNormalUser = true;
                description = "nixy";
                extraGroups = [ "docker" "video" "networkmanager" "wheel" "input" "disk" ];
                packages = with pkgs;
		[];
        };
}
