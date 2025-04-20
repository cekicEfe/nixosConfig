{
  programs.nixvim.plugins = {
    comment-box = {
      enable = true;
      settings = {
        borders = {
          bottom_left = "X";
          bottom_right = "X";
          top_left = "X";
          top_right = "X";
        };
        box_width = 120;
        comment_style = "block";
        doc_width = 100;
        inner_blank_lines = true;
        line_width = 40;
        lines = { line = "*"; };
        outer_blank_lines_below = true;
      };
    };
  };
}
