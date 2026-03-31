{ pkgs,  ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with pkgs.emacs-gtk if desired
    extraPackages = epkgs: [ epkgs.nix-mode epkgs.nixfmt ];
    extraConfig = pkgs.lib.readFile ./emacs_config.el;
  };
}
