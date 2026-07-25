{ pkgs, emacs_theme, ... }:
let
  #  yotsuba-theme = pkgs.fetchgit {
  #    url = "https://github.com/Senka07/yotsuba-emacs-theme.git";
  #    rev = "c06f5f6ce65cba3e4fe2382c4bd9192de24a3327";
  #    hash = "sha256-D+bPoNRfNYMx+XNP4P/bRgV/h6NDV3KGY7uJa9QNTSk=";
  #  };

  yotsuba-theme = pkgs.emacsPackages.trivialBuild {
    pname = "yotsuba-theme";
    version = "2026-4-09"; # Use the date of the last commit or a version string
    src = pkgs.fetchgit {
      url = "https://github.com/Senka07/yotsuba-emacs-theme.git";
      rev = "c06f5f6ce65cba3e4fe2382c4bd9192de24a3327";
      hash = "sha256-D+bPoNRfNYMx+XNP4P/bRgV/h6NDV3KGY7uJa9QNTSk=";
    };
  };

  sidetab = pkgs.emacsPackages.trivialBuild {
    pname = "sidetab";
    version = "1.0";
    src = ./sidetab.el;
  };

in {

  home.packages = [
    #
    pkgs.jetbrains-mono
    pkgs.nixd
    pkgs.haskell-language-server
    pkgs.clang-tools
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages = epkgs: [
      # epkgs.lsp-mode
      # epkgs.haskell-mode
      # epkgs.nix-mode
      # epkgs.rust-mode
      # epkgs.markdown-mode
      # epkgs.dap-mode
      epkgs.org

      epkgs.string-inflection
      epkgs.treesit-grammars.with-all-grammars
      epkgs.multiple-cursors
      epkgs.move-text
      epkgs.magit
      epkgs.xclip
      epkgs.envrc
      epkgs.dumb-jump
      epkgs.company
      epkgs.exwm
      epkgs.vterm
      epkgs.use-package

      (if emacs_theme == "yotsuba" then
        yotsuba-theme
      else if emacs_theme == "catppuccin" then
        epkgs.catppuccin-theme
      else
        null)
    ];

    extraConfig =
      (pkgs.lib.readFile ./emacs_config.el)
      + (if emacs_theme == "yotsuba" then ''
        (add-to-list 'custom-theme-load-path 
               (file-name-directory (locate-library "yotsuba-theme")))
        (load-theme 'yotsuba-b :no-confirm)
      '' else if emacs_theme == "catppuccin" then
        "(load-theme 'catppuccin :no-confirm)"
      else
        "");
  };
}
