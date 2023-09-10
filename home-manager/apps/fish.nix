{ config, lib, pkgs, ... }:

{
  # fish cannot be set as the default shell of the user because fish shell is not
  # accessible by chsh. One solution is to sneak the fish shell on bash.
  # Probably there is already a '.bashrc' file that will make the flake give you and
  # error/warning. If bash is not going to be used, move it to '.bashrc.backup' and
  # fish will take over your "default shell"
  # home.file.".bashrc" = lib.mkIf config.programs.fish.enable {
  #   text = ''
  #     exec ${config.programs.fish.package}/bin/fish
  #   '';
  # };
  programs.fish = {
    enable = true;
    shellAliases = {
      cat = "bat";
      diff = "diffr";
      glow = "glow --pager";
      ip = "ip --color --brief";
      ls = "eza";
      ll = "eza --long";
      la = "eza --all --long";
      lt = "eza --tree";
      less = "bat --paging=always";
      more = "bat --paging=always";
      tree = "exa --tree --group-directories-first";
      wget = "wget2";
    };
    shellAbbrs = {
      ga = "git add";
      gc = "git commit -m ";
      gp = "git push";
      nr = "nix run nixpkgs#home-manager -- switch --flake .";
    };
    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
      (builtins.readFile ./config.fish)
      "set -g SHELL ${pkgs.fish}/bin/fish"
    ]));
    plugins = with pkgs.fishPlugins; [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
      { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "bass"; src = pkgs.fishPlugins.bass.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      {
        name = "fish-autovenv";
        src = pkgs.fetchFromGitHub {
          owner = "mmartinortiz";
          repo = "fish-autovenv";
          rev = "1.0.0";
          sha256 = "f6ib/XcgnKGYbhfZca0PMScbHgZP2nMqF5hEbyG0Afo=";
        };
      }
    ];
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
