set -g theme_powerline_fonts yes
set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_nerd_fonts yes

fish_add_path ~/.local/bin

# Enable VI key bindings
if test -n "$TERM"
  fish_vi_key_bindings
  set -g fish_cursor_default     block      blink
  set -g fish_cursor_insert      line       blink
  set -g fish_cursor_replace_one underscore blink
  set -g fish_cursor_visual      block
end

