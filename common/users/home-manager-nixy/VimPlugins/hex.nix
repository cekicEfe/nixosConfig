{
  programs.nixvim.plugins = {
    hex = {
      #
      enable = true;
      settings = {
        assemble_cmd = "xxd -r";
        dump_cmd = "xxd -g 1 -u";
      };
    };
  };
}
