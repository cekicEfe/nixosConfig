{
	services.xserver = {
		enable = true;
		xkb.layout = "tr";
		xkb.variant = "";
	};
	console.keyMap = "trq";

	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
}
