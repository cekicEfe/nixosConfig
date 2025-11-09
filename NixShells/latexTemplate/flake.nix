{
  description = "Latex development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        tex = (pkgs.texlive.combine {
          inherit (pkgs.texlive)
            scheme-full dvisvgm dvipng # for preview and export as html
            wrapfig amsmath ulem hyperref capt-of;
          #(setq org-latex-compiler "lualatex")
          #(setq org-preview-latex-default-process 'dvisvgm)
        });
      in {
        devShell = pkgs.mkShell {

          # Dependencies for project
          buildInputs = [ tex pkgs.texlab pkgs.texstudio pkgs.texmaker ];

          #links libraries to shell
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ ];

          shellHook = ''
            PS1="[\\u@\\h && LATEX-DEV-ENV:\\w]\$ "
          '';
        };
      });
}
