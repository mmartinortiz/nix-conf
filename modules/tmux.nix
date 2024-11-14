{
  config,
  pkgs,
  ...
}: {
  # Server specific configuration
  programs.tmux = {
    enable = true;
    # Automatically spawn a session if trying to attach and none are running.
    newSession = true;
    # Set the prefix key. Overrules the “shortcut” option when set.
    prefix = "C-a";
    # Use 24 hour clock.
    clock24 = true;
    # VI or Emacs style shortcuts.
    keyMode = "vi";
    # Whether to enable mouse support.
    mouse = true;
    # Set the default-shell tmux variable.
    shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
    # Set the $TERM variable.
    terminal = "tmux-256color";
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
        # https://github.com/tmux-plugins/tmux-resurrect
        # Manually persists tmux environment across system restarts.
        #   prefix + Ctrl-s - save
        #   prefix + Ctrl-r - restore
        #
        plugin = resurrect;
        # Restore Neovim sessions
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-continuum
        # Continuous saving of tmux environment. Automatic restore when tmux is started.
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-save-interval '5'
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
        '';
      }
    ];
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
