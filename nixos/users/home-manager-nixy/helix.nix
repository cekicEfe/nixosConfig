{ pkgs, ... }: {
  home.packages =
    [ pkgs.clang-tools pkgs.nixfmt pkgs.python312Packages.python-lsp-server ];
  programs.helix = {
    defaultEditor = true;
    enable = true;
    settings = {
      theme = "tokyonight";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "c";
        auto-format = true;
        formatter.command = "${pkgs.clang-tools}/bin/clang/tools/clang-format";
      }
      {
        name = "cpp";
        auto-format = true;
        formatter.command = "${pkgs.clang-tools}/bin/clang/tools/clang-format";
      }
    ];
  };
}
