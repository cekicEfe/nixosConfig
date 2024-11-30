{
  programs.nixvim.plugins = {
    edgy = {
      enable = true;
      settings = {
	animate = {
	  enabled = false;
	};
	bottom = [
	  {
	    filter = ''
	      function(buf, win)
		return vim.api.nvim_win_get_config(win).relative == ""
	      end
	    '';
	    ft = "toggleterm";
	    size = 30;
	  }
	  {
	    filter = ''
	      function(buf)
		return vim.bo[buf].buftype == "help"
	      end
	    '';
	    ft = "help";
	    size = 20;
	  }
	];
	left = [
	  {
	    ft = "NvimTree";
	    size = 30;
	    title = "nvimtree";
	  }
	  {
	    ft = "Outline";
	    open = "SymbolsOutline";
	  }
	  {
	    ft = "dapui_scopes";
	  }
	  {
	    ft = "dapui_breakpoints";
	  }
	  {
	    ft = "dap-repl";
	  }
	];
	wo = {
	  signcolumn = "no";
	  spell = false;
	  winbar = false;
	  winfixheight = false;
	  winfixwidth = false;
	  winhighlight = "";
	};
      };
    };
  };
}
