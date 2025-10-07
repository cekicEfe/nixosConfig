{
  description = "Python development environment";

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
            (pkgs.python3.withPackages (python-pkgs:
              with python-pkgs; [
                numpy
                pandas
                matplotlib
                seaborn
                scikit-learn
              ]))
          ];
          shellHook = ''
            echo "Python development environment is ready!"
            PS1="[\\u@\\h && PYTHON-DEV-ENV:\\w]\$ "
          '';
        };
      });
}
