{

  imports = [
    ./vimPlugins/lsp.nix
    ./vimPlugins/neotree.nix
    ./vimPlugins/telescope.nix
    ./vimPlugins/cmp.nix
    ./vimPlugins/floaterm.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lualine.enable = true; 
    globals.mapleader = " ";

    colorschemes.tokyonight = {
      enable = true;
      transparent = true;
    };

    opts = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };

    plugins = {
      transparent = {	
	enable = true;
	settings = {
	  exclude_groups = [ ];
	  extra_groups = [
	    "BufferLineTabClose"
	    "BufferLineBufferSelected"
	    "BufferLineFill"
	    "BufferLineBackground"
	    "BufferLineSeparator"
	    "BufferLineIndicatorSelected"
	  ];
	};
      };
    };


  };
}
