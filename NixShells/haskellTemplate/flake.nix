{
  description = "Haskell development environment";

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
            pkgs.ghc
            pkgs.haskell-language-server
            pkgs.cabal-install
            pkgs.cabal2nix

            pkgs.blas
            pkgs.lapack
            pkgs.SDL2
            pkgs.imgui
            pkgs.libxkbcommon
            pkgs.glew
            pkgs.libGL
            pkgs.libGLU
            pkgs.xorg.libX11
            pkgs.xorg.libXi
            pkgs.xorg.xinit
            pkgs.xorg.libXrandr
            pkgs.xorg.libXxf86vm
            pkgs.xorg.libXcursor
            pkgs.xorg.libXinerama
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.blas
            pkgs.lapack
            pkgs.SDL2
            pkgs.imgui
            pkgs.libxkbcommon
            pkgs.glew
            pkgs.libGL
            pkgs.libGLU
            pkgs.xorg.libX11
            pkgs.xorg.libXi
            pkgs.xorg.xinit
            pkgs.xorg.libXrandr
            pkgs.xorg.libXxf86vm
            pkgs.xorg.libXcursor
            pkgs.xorg.libXinerama
          ];

          nativeBuildInputs = [ pkgs.pkg-config ];

          shellHook = ''
            PS1="[\\u@\\h && HASKELL-DEV-ENV:\\w]\$ "
            export PKG_CONFIG_PATH="${pkgs.imgui}/lib:${pkgs.SDL2}/lib:${pkgs.glew}/lib:$PKG_CONFIG_PATH"
          '';

        };
        packages.default =
          pkgs.haskellPackages.callCabal2nix "haskellConv" ./. { };
      });
}
