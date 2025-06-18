{
  programs.nixvim.plugins = {
    lsp-lines = {
      #
      luaConfig.post = ''
        vim.keymap.set(
          "",
          "<Leader>l",
          require("lsp_lines").toggle,
          { desc = "Toggle lsp_lines" }
        )'';
      enable = true;
    };
  };
}
