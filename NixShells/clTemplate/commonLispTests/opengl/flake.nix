{
  description = "Ceng development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {

          # Dependencies for project
          buildInputs = [
            #
            pkgs.glfw
            (pkgs.sbcl.withPackages (ps:
              with ps; [
                #
                alexandria
                local-time
                cl-glfw3
                cl-opengl
                trivial-main-thread
                glad-blob
              ]))

            pkgs.libpng
            pkgs.pkg-config # To manage compilation flags
            pkgs.libxkbcommon
            pkgs.libGL
            pkgs.xorg.libX11
            pkgs.mesa

            pkgs.asdf-vm
            pkgs.roswell
          ];

          #links libraries to shell
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            #
          ];

          shellHook = ''
            PS1="[\\u@\\h && CENG-DEV-ENV:\\w]\$ "
          '';
        };
      });
}
