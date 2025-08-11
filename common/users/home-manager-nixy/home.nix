{ pkgs, config, ... }: {

  imports = [ ./alacritty.nix ./nixvim.nix ./helix.nix ./kitty.nix ];

  #programs.home-manager.enable = true;

  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";

    file."${config.xdg.configHome}" = {
      source = ./dotfiles;
      recursive = true;
    };

    shellAliases = {
      snrsf = "sudo nixos-rebuild switch --flake .#";
      hmsf = "home-manager switch --flake .#nixy";
    };

    packages = [
      pkgs.blender
      pkgs.hasklig
      pkgs.xorg.xmag
      #pkgs.bottles
      #pkgs.vscode
      pkgs.ranger
      pkgs.ripgrep
      pkgs.fastfetch
      pkgs.btop
      pkgs.tor-browser
      pkgs.yazi
      pkgs.mesa-demos
      pkgs.emacs
      #pkgs.wine
      #pkgs.zoom-us
      #pkgs.kicad
      #pkgs.cmatrix
      pkgs.cataclysm-dda
      #pkgs.dwarf-fortress
      pkgs.rar
      #pkgs.kdePackages.kate
      #pkgs.tmux
      pkgs.evince
      #pkgs.konsole
      #pkgs.mars-mips
    ];
  };

  programs.bash = {
    enable = true;
    initExtra = "\n      export VISUAL=nvim;\n      export EDITOR=nvim;\n    ";
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
