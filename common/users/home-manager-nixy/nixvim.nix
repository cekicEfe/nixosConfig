{
  imports = [
    ./VimPlugins/lsp.nix
    #./VimPlugins/neotree.nix
    ./VimPlugins/telescope.nix
    ./VimPlugins/cmp.nix
    ./VimPlugins/treesitter.nix
    ./VimPlugins/formatter.nix
    ./VimPlugins/noice.nix
    ./VimPlugins/lsp-signature.nix
    ./VimPlugins/alpha.nix
    ./VimPlugins/lsp-lines.nix
    ./VimPlugins/hex.nix
    ./VimPlugins/cmp-latex-symbols.nix
    #./VimPlugins/jupytext.nix
    #./VimPlugins/vim-slime.nix
    #./VimPlugins/hlchunk.nix
    #./VimPlugins/smear-cursor.nix
    #./vimPlugins/colorizer.nix
  ];

  programs.nixvim = {
    enable = true;
    plugins.lualine.enable = true;
    plugins.web-devicons.enable = true;
    globals.mapleader = " ";

    keymaps = [{
      key = "<leader>nt";
      action = ":Explore <CR>";
      options.silent = true;
    }];

    colorschemes.catppuccin = {
      enable = true;
      # transparent = true;
      settings = {
        color_overrides = { mocha = { base = "#1e1e2f"; }; };
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          notify = false;
          nvimtree = true;
          treesitter = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
        };
        term_colors = true;
      };
    };

    opts = {
      number = true; # Show line numbers
      relativenumber = false; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
    };
  };
}
