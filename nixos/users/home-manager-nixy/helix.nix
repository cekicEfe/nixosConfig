{ pkgs, ... }: {
  home.packages = [
    pkgs.clang-tools
    pkgs.nixfmt-classic
    pkgs.python312Packages.python-lsp-server
    pkgs.lua-language-server
    pkgs.texlab
    pkgs.nixd
  ];
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

    themes = {
      tokyonight = {
        "inherits" = "tokyonight";
        "ui.background" = { };
      };
    };

    languages = {
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
          # command = "nil";
          config.nil = {
            formatting.command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
            # formatting.command = [ "alejandra" "-q" ];
            nix.flake.autoEvalInputs = true;
          };
        };
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        language-servers = [ "nixd" ];
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
