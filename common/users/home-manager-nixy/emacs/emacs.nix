{ pkgs, ... }: {

  home.packages = [ pkgs.agda ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
      epkgs.multiple-cursors
      epkgs.move-text
      epkgs.nix-mode
      epkgs.nixfmt
      epkgs.company
      epkgs.catppuccin-theme
      epkgs.magit
      epkgs.avy
      epkgs.xclip
      epkgs.markdown-mode
      epkgs.agda2-mode
    ];

    extraConfig = pkgs.lib.readFile ./emacs_config.el;
  };
}
