{ stdenv, fetchurl, autoPatchelfHook, pkgs, buildFHSUserEnv }:
let
  ti_comp = stdenv.mkDerivation rec {
    pname = "ti-msp430-compiler";
    version = "21.6.1.LTS";

    src = fetchurl {
      url =
        "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-p4jWEYpR8n/21.6.1.LTS/ti_cgt_msp430_21.6.1.LTS_linux-x64_installer.bin";
      sha256 = "sha256-Ja/V3T1MxWDR76UcLUkqUIVIgt42YDejIpHbEfHFd94=";
    };

    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [ pkgs.glibc pkgs.glib pkgs.bash pkgs.btar pkgs.gzip ];

    unpackPhase = ''
      cp ${src} installer.bin
      chmod +x installer.bin
    '';

    installPhase = ''
      mkdir $out
      mkdir $out/test
      cp installer.bin $out/test
    '';
  };
in buildFHSUserEnv {
   name = "test";
   targetPkgs = [
     ti_comp
   ];
   runScript = "installer.bin --mode unattended --prefix build-out";
}
