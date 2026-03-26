{ pkgs, config, ... }: {

  imports = [
    ./nushell.nix
    ./alacritty.nix

    #./nixvim.nix
    ./picom.nix
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
      hmsf = "home-manager switch --flake .#nixy";
    };

    packages = [
      pkgs.blender
      pkgs.xorg.xmag
      pkgs.ranger
      pkgs.ripgrep
      pkgs.fastfetch
      pkgs.picom
      pkgs.btop
      pkgs.tor-browser
      pkgs.mesa-demos
      pkgs.emacs
      pkgs.cataclysm-dda
      pkgs.rar
      pkgs.evince
      pkgs.vim
      pkgs.tmux
    ];
  };

  programs.bash = {
    enable = true;
    #initExtra = "\n      export VISUAL=vim;\n      export EDITOR=vim;\n    ";
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
