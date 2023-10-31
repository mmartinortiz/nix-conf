{pkgs, ...}: {
  # Server specific configuration
  programs.fish = {
    # Extend fish with the fish.tmux plugin for automatically
    # start and attach to a tmux session on login
    interactiveShellInit = ''
    if set -q TMUX
	    tmux switch -t $session_name
    else
	    tmux new-session -D -s "$session_name" -c "$dir" $argv[3..-1] &>/dev/null || \
		  tmux attach -t "$session_name" -c "$dir"
    end
    '';
  };
}
