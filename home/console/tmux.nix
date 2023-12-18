{
  config,
  pkgs,
  ...
}: {
  # Server specific configuration
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shortcut = "a";
    plugins = with pkgs.tmuxPlugins; [
      nord
      vim-tmux-navigator
      {
        plugin = yank;
        extraConfig = ''
          # Clipboard integration for Linux
          # bind-key -T copy-mode C-w send-keys -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
          # bind-key -T copy-mode M-w send-keys -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
          # bind-key -T copy-mode MouseDragEnd1Pane send -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
          # bind-key -T root C-y run "xsel -o | tmux load-buffer - ; tmux paste-buffer"
          set -g @yank_selection_mouse 'clipboard' # or 'primary' or 'secondary'
          # Get into copy mode with Ctrl-g
          bind-key -n 'C-g' copy-mode
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-continuum
        # Continuous saving of tmux environment. Automatic restore when tmux is started.
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-save-interval '15'
          set -g @continuum-restore 'on'
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-resurrect
        # Manually persists tmux environment across system restarts.
        #   prefix + Ctrl-s - save
        #   prefix + Ctrl-r - restore
        #
        plugin = resurrect;
        # Restore Neovim sessions
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
    terminal = "screen-256color";
    extraConfig = ''
      bind k next-window
      bind j previous-window

      # More intuitive vertical and horizontal splits
      bind v split-window -v -c "#{pane_current_path}"
      bind h split-window -h -c "#{pane_current_path}"

      set -g status-position "top"

      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded ~/.config/tmux/tmux.conf"
    '';
  };
}
