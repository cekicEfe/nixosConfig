{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {

  name = "test-deamon";
  version = "master";

  src = ./.;

  nativeBuildInputs = with pkgs; [ cmake gcc ];
  buildInputs = with pkgs; [ glibc ];

  configurePhase = ''
    mkdir build && cd build
    cmake ..
  '';

  buildPhase = ''
    cmake --build .
  '';

  installPhase = "";

  meta = { description = "This is a test deamon"; };

}
