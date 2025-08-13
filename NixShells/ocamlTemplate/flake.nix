{
  description = "Ocaml development environment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            #
            pkgs.ocamlPackages.dune_3
            pkgs.ocamlPackages.utop
            pkgs.opam
            pkgs.ocaml
            pkgs.ocamlPackages.csv
            pkgs.ocamlPackages.ocaml-lsp
          ];
          shellHook = ''
            echo "Ocaml development environment is ready!"
            PS1="[\\u@\\h && OCAML-DEV-ENV:\\w]\$ "
          '';
        };
      });
}
