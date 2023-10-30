{pkgs, ...}: {
  # Server specific configuration
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      nord
      vim-tmux-navigator
      yank
    ];
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      # Clipboard integration for Linux
      # bind-key -T copy-mode C-w send-keys -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
      # bind-key -T copy-mode M-w send-keys -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
      # bind-key -T copy-mode MouseDragEnd1Pane send -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
      # bind-key -T root C-y run "xsel -o | tmux load-buffer - ; tmux paste-buffer"

      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded ~/.config/tmux/tmux.conf"
      bind k next-window
      bind j previous-window
    '';
  };

  programs.fish = {
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
