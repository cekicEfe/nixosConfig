{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11.5;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
          #family = "Hasklig";
          #style = "Bold";
        };
      };
      general.import = [
        (pkgs.writeText "my-alacritty-theme"
          (builtins.readFile ./catppuccin.toml))
      ];
    };
  };
}
