{ pkgs, ... }:{

  imports = [
    ./alacritty.nix
    ./nixvim.nix
  ];

  home = {
    username = "nixy"; 
    homeDirectory = "/home/nixy";
    stateVersion = "24.05";

    shellAliases = ./bashAliases.nix;

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
    ];
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
