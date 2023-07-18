{ config, lib, ... }:

{
  # fish cannot be set as the default shell of the user because fish shell is not
  # accessible by chsh. One solution is to sneak the fish shell on bash
  home.file.".bashrc" = lib.mkIf config.programs.fish.enable {
    text = ''
      exec ${config.programs.fish.package}/bin/fish
    '';
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      cat = "bat";
      diff = "diffr";
      glow = "glow --pager";
      ip = "ip --color --brief";
      less = "bat --paging=always";
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
