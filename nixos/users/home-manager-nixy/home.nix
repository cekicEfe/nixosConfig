{ pkgs, ... }: {

  imports = [ ./alacritty.nix ./nixvim.nix ./helix.nix ];

  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.05";

    packages = [
      pkgs.ripgrep
      pkgs.fastfetch
      pkgs.btop
      pkgs.tor-browser
      pkgs.ranger
      pkgs.mesa-demos
      pkgs.wine
      pkgs.zoom-us
      pkgs.kicad
      pkgs.cmatrix
      pkgs.cataclysm-dda
      pkgs.dwarf-fortress
      pkgs.rar
      pkgs.evince
    ];
  };

  programs.bash = {
    enable = true;
    initExtra = "\n      export VISUAL=hx;\n      export EDITOR=hx;\n    ";
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
