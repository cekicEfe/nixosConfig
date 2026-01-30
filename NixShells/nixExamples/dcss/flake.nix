{
  description = "DCSS environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {

        devShells.default = pkgs.mkShell {
          buildInputs = [
            (pkgs.callPackage ./crawl.nix { })

          ];

          shellHook = ''
            PS1="[\\u@\\h && DCSS-ENV:\\w]\\$ "
          '';
        };
      });
}
