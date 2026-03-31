{ pkgs, ... }: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor.lsp.enable = false;
    };

    themes = {
      catppuccin_mocha = {
        "inherits" = "catppuccin_mocha";
        #use this to make background transparant
        "ui.background" = { };
      };
    };
  };
}
