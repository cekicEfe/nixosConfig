{ pkgs, config,builtins, ... }: {

  imports = [
    ./alacritty.nix
    ./emacs/emacs.nix
    ./helix.nix
    ./kitty.nix
  ];

  #not important right now
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
      ems = "emacs -nw"; 
      hmsf = "home-manager switch --flake .#nixy";
    };

    packages = [
      pkgs.clang-tools
      pkgs.nixfmt-classic
      pkgs.python312Packages.python-lsp-server
      pkgs.lua-language-server
      pkgs.texlab
      pkgs.nixd
      pkgs.godot

      pkgs.blender
      pkgs.xorg.xmag
      pkgs.ranger
      pkgs.ripgrep
      pkgs.fastfetch
      pkgs.picom
      pkgs.btop
      pkgs.tor-browser
      pkgs.mesa-demos
      pkgs.cataclysm-dda
      pkgs.rar
      pkgs.evince
      pkgs.vim
      pkgs.tmux
    ];
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
  
  programs.bash = {
    enable = true;
    initExtra = "export VISUAL='ems';export EDITOR='ems';";
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
