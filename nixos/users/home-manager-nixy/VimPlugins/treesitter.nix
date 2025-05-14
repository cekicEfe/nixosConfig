{ pkgs, ... }: {

  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>foldclose<CR>";
        key = "<leader>fc";
        options.silent = true;
      }

      {
        action = "<cmd>foldopen<CR>";
        key = "<leader>fo";
        options.silent = true;
      }

    ];
  };

  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      # ensure_installed = "all";
      highlight = {
        additional_vim_regex_highlighting = true;
        custom_captures = { };
        disable = [ "rust" ];
        enable = true;
      };
      ignore_install = [ "rust" ];
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = false;
          node_decremental = "grm";
          node_incremental = "grn";
          scope_incremental = "grc";
        };
      };
      indent = { enable = true; };
      parser_install_dir = {
        __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
      };
      sync_install = false;
    };

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
