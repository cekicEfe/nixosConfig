{ config, pkgs, ... }:
{
	services.udisks2.enable = true;
	users.users.nixy = {
                isNormalUser = true;
                description = "nixy";
                extraGroups = [ "video" "networkmanager" "wheel" "input" "disk" ];
                packages = with pkgs;
		[];
        };
}
