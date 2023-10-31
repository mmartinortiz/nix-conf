{...}: {
  # Server specific configuration
  programs.fish = {
    # Extend fish with the fish.tmux plugin for automatically
    # start and attach to a tmux session on login
    interactiveShellInit = ''
    if set -q TMUX
      tmux switch -t main
    else
      tmux new-session -D -s main -c "$HOME" || \
      tmux attach -t main -c "$HOME"
    end
    '';
  };
}
