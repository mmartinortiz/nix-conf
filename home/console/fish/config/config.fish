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

