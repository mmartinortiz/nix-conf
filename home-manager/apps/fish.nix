{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      ls = "exa";
      ll = "exa -lha";
      lt = "exa --tree";
      psg = "ps aux | rg -v rg | rg -i -e VSZ -e";
      e = "emacsclient -nc";
      E = "sudoedit";
      grep = "rg";
      cat = "bat";
    };
    functions =
      {
        __fish_command_not_found_handler = {
          body = "__fish_default_command_not_found_handler $argv[1]";
          onEvent = "fish_command_not_found";
        };

        gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      }
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
