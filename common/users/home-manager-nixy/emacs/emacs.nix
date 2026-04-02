{ pkgs,  ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with pkgs.emacs-gtk if desired
    extraPackages = epkgs: [
      epkgs.multiple-cursors
      epkgs.nix-mode
      epkgs.nixfmt
      epkgs.company
      epkgs.catppuccin-theme
      epkgs.magit
      epkgs.avy
      epkgs.xclip
    ];
    extraConfig = pkgs.lib.readFile ./emacs_config.el;
  };
}
