# Define Fish colors
set -g fish_color_autosuggestion 707A8C
set -g fish_color_cancel --reverse
set -g fish_color_command 5CCFE6
set -g fish_color_comment 5C6773
set -g fish_color_cwd 73D0FF
set -g fish_color_cwd_root red
set -g fish_color_end F29E74
set -g fish_color_error FF3333
set -g fish_color_escape 95E6CB
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_host_remote
set -g fish_color_keyword
set -g fish_color_match F28779
set -g fish_color_normal CBCCC6
set -g fish_color_operator FFCC66
set -g fish_color_option
set -g fish_color_param CBCCC6
set -g fish_color_quote BAE67E
set -g fish_color_redirection D4BFFF
set -g fish_color_search_match --background=FFCC66
set -g fish_color_selection --background=FFCC66
set -g fish_color_status red
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# Customize "pure" colors
set -g pure_color_current_directory brcyan
set -g pure_color_mute yellow

fish_add_path ~/.local/bin

# Enable VI key bindings
if test -n "$TERM"
  fish_vi_key_bindings
  set -g fish_cursor_default     block      blink
  set -g fish_cursor_insert      line       blink
  set -g fish_cursor_replace_one underscore blink
  set -g fish_cursor_visual      block
end

