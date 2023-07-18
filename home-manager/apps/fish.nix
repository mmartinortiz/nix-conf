{
  programs.fish = {
    enable = true;
    shellAliases = {
      cat = "bat";
      diff = "diffr";
      glow = "glow --pager";
      grep = "rg";
      ip = "ip --color --brief";
      less = "bat --paging=always";
      ll = "exa -lha";
      ls = "exa";
      lt = "exa --tree";
      more = "bat --paging=always";
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
  };
}
