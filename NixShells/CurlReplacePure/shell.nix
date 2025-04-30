{ pkgs ? import <nixpkgs> { } }:
let myCurl = pkgs.curl.override { c-aresSupport = true; };
in pkgs.mkShell {
  #
  buildInputs = [ myCurl ];
}
