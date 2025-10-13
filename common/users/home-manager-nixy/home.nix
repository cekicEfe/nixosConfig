{ pkgs, config, ... }: {

  imports =
    [ ./nushell.nix ./alacritty.nix ./nixvim.nix ./helix.nix ./kitty.nix ];

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
      pkgs.btop
      pkgs.tor-browser
      pkgs.mesa-demos
      pkgs.emacs
      pkgs.cataclysm-dda
      pkgs.rar
      pkgs.evince
    ];
  };

  programs.bash = {
    enable = true;
    #initExtra = "\n      export VISUAL=nvim;\n      export EDITOR=nvim;\n    ";
  };

  programs.git = {
    enable = true;
    userName = "cekicEfe";
    userEmail = "efecekic0@gmail.com";
  };
}
