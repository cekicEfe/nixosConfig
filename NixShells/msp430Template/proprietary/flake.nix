{
  description = "Set up msp430 TI proprietary GCC  toolchain and mspdebug";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      ti_comp = pkgs.callPackage ./default.nix {};
      in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [ ti_comp ];
        shellHook = ''
          export TI_PATH=${ti_comp};
        '';
      };
    };
}
