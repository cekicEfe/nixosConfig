{ lib, stdenv, fetchFromGitHub, libgcc, gtk2, wxGTK32, cmake, gnumake, ninja }:
let
in stdenv.mkDerivation {
  pname = "treemaker";
  version = "v5.1.1m-beta";

  src = fetchFromGitHub {
    owner = "vishvish";
    repo = "treemaker";
    rev = "86d2166077d3612b0f69816aed7af54494efa166";
    hash = "sha256-k0Nlq/S97/azIMk1mc18zh7GkwJYCB0yGEd2r7KKXtg=";
  };

  nativeBuildInputs = [
    #
    libgcc
    gnumake
    cmake
    ninja
    wxGTK32
  ];

  buildInputs = [
    #
    gtk2
    wxGTK32
  ];

  meta = with lib; {
    homepage = ""; # change it to apps creators url
    description = "";
    longDescription = "";
    license = licenses.gpl2;
    maintainers = with maintainers; [ ];
    platforms = platforms.unix;
  };

}
