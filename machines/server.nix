{pkgs, ...}: {
  # Server specific configuration
  programs.fish = {
    # Extend fish with the fish.tmux plugin for automatically
    # start and attach to a tmux session on login
    plugins = [
      {
        name = "fish.tmux";
        src = pkgs.fetchFromGitHub {
          owner = "budimanjojo";
          repo = "tmux.fish";
          rev = "87ef5c238b7fb133d7b49988c7c3fcb097953bd2";
          sha256 = "sha256-ds1WN10Xlp6BYk1Wooq8NIkVyt5gJguKBH4JBrPo/Qo=";
        };
      }
    ];
    interactiveShellInit = ''
      set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf
    '';
  };
}
