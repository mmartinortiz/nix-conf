# Customize "pure" colors and options
set -g pure_color_current_directory brcyan
set -g pure_color_mute yellow

set --universal pure_symbol_virtualenv_prefix "" # 🐍
set --universal pure_color_virtualenv "green"

fish_add_path ~/.local/bin

# Enable VI key bindings
if test -n "$TERM"
  fish_vi_key_bindings
  set -g fish_cursor_default     block      blink
  set -g fish_cursor_insert      line       blink
  set -g fish_cursor_replace_one underscore blink
  set -g fish_cursor_visual      block
end

# Sponge plugin config
set sponge_delay 5
