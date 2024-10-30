{pkgs , ...}:{

  programs.nixvim = {
    keymaps = [
      {
	action =  "<cmd>foldclose<CR>" ;
	key = "<leader>fc";
	options.silent = true;
      }

      {
	action =  "<cmd>foldopen<CR>" ;
	key = "<leader>fo";
	options.silent = true;
      }

    ];
  };

  programs.nixvim.plugins.treesitter = {
    enable = true;
    indent = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      c
      cpp
      bash
      json
      lua
      make
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
  };
}
