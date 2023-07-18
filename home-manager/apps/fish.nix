{
  programs.fish = {
    enable = true;
    shellAliases = {
      cat = "bat";
      diff = "diffr";
      glow = "glow --pager";
      grep = "rg";
      htop = "btm --basic --tree --hide_table_gap --dot_marker --mem_as_value";
      ip = "ip --color --brief";
      less = "bat --paging=always";
      ll = "exa -lha";
      ls = "exa";
      lt = "exa --tree";
      more = "bat --paging=always";
      top = "btm --basic --tree --hide_table_gap --dot_marker --mem_as_value";
      tree = "exa --tree";
      wget = "wget2";
    };
    functions =
      {
        __fish_command_not_found_handler = {
          body = "__fish_default_command_not_found_handler $argv[1]";
          onEvent = "fish_command_not_found";
        };

        gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      };
    settings = {
      colorscheme = "material-tc";
      mkparents = true;
      softwrap = true;
      tabmovement = true;
      tabsize = 2;
      tabstospaces = true;
      autosu = true;
    };
  };
}
