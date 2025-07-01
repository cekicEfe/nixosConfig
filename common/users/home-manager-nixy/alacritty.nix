{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        size = 11.5;
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
          #family = "Hasklig";
          #style = "Bold";
        };
      };

      # colors.primary.background = "#1d2021";
    };
  };
}
