{
  programs.nixvim.plugins = {
    lsp-format.enable = true;

    lsp = {
      keymaps = {
	silent = true;
	diagnostic = {
	  # Navigate in diagnostics
	  "<leader>k" = "goto_prev";
	  "<leader>j" = "goto_next";
	};

	lspBuf = {
	  gd = "definition";
	  gD = "references";
	  gt = "type_definition";
	  gi = "implementation";
	  K = "hover";
	  "<F2>" = "rename";
	};
      };

      enable = true;
      servers = {
pyright.enable = true;
nixd.enable = true;
	clangd.enable = true;
      };
    };
  };
}
