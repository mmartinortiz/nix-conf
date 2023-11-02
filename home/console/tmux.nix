{config, pkgs, ...}: {
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
    shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
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
}
