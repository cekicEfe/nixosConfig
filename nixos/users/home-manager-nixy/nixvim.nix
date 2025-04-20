{
  imports = [
    ./vimPlugins/lsp.nix
    ./vimPlugins/neotree.nix
    ./vimPlugins/telescope.nix
    ./vimPlugins/cmp.nix
    ./vimPlugins/treesitter.nix
    ./vimPlugins/formatter.nix
    ./vimPlugins/noice.nix
    ./vimPlugins/lsp-signature.nix
    ./vimPlugins/alpha.nix
  ];

  programs.nixvim = {
    enable = true;
    plugins.lualine.enable = true;
    globals.mapleader = " ";

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
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
    };

    #plugins = {
    #  transparent = {
    #    enable = true;
    #    settings = {
    #      exclude_groups = [ ];
    #      extra_groups = [
    #        "BufferLineTabClose"
    #        "BufferLineBufferSelected"
    #        "BufferLineFill"
    #        "BufferLineBackground"
    #        "BufferLineSeparator"
    #        "BufferLineIndicatorSelected"
    #      ];
    #    };
    #  };
    #};
  };
}
