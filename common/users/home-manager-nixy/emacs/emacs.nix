{ pkgs, ... }:
let
  tree-sitter-agda = pkgs.tree-sitter.buildGrammar {
    language = "agda";
    version = "1.3.3";
    src = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter-agda";
      rev = "master";
      sha256 =
        "sha256-5h56+A7ZypckJ9mwht7XP/66oiehwAEQ4Z6WeVhQBvQ="; # Replace with actual hash
    };
  };

#  agda-highlight = pkgs.fetchurl {
#    url = "https://github.com/tree-sitter/tree-sitter-agda/blob/master/queries/highlights.scm";
#    sha256 = "0000000000000000000000000000000000000000000000000000";
#  };

in {

  home.sessionVariables.TREE_SITTER_QUERY_PATH = "${tree-sitter-agda}/queries";

  home.packages = [
    tree-sitter-agda
    pkgs.agda
    #pkgs.tree-sitter-grammars.tree-sitter-cmake
    #pkgs.tree-sitter-grammars.tree-sitter-nix
  ];

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
      epkgs.markdown-mode
      epkgs.agda2-mode
    ];
    
    extraConfig = pkgs.lib.readFile ./emacs_config.el;
  };
}
