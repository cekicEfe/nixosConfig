{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
	size = 7.0;
      };
      window = {
	opacity = 0.9;
	padding = {
	  x = 5;
	  y = 5;
	};
      };
      colors = {
	primary = {
	  background = "0x1d2021";
	  foreground = "0xebdbb2";
	};
	cursor = {
	  text = "0x1d2021";
	  cursor = "0xebdbb2";
	};
      };
    };
  };
}
