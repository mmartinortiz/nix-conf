# Cheatsheet

## tmux

### Panes & Windows

- Splits
  - `C-a v` **v**ertical split.
  - `C-a h` **h**orizontal split.

- Navigation
  - `C-a w` shows all windows and panes.
  - `C-a j|k` move to previous/next window.
  - `C h|j|k|l` moves between panes. Provided by [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).
  - `C-a <arrow key>` move between panes.
  - `C-a n` next window.
  - `C-a p` previous window.

- Resize panes
  - `C-a C-<arrow key>` resizes the pane in small steps.
  - `C-a z` maximazes the pane. Press it again to restore the size.
  - `C-a Space` iterates over layouts.

### Copy and Paste

[Official Tmux copy and paste documentation](https://github.com/tmux/tmux/wiki/Getting-Started#copy-and-paste).

- `C-a [` enters the **copy mode**. `vi` movements apply.

- Copy mode
  - `space` select text.
  - `y` copies selected text (and exists copy mode).
  - `Y` "put" selection. Equivalent to copying a selection, and pasting it to the command line.

- Normal mode
  - `C-a y` copies text from the command line to the clipboard (?).
  - `C-a Y` copy the current's pane working directory to the clipboard.
  - `C-a ]` paste current buffer.
  - `C-a =` shows a list of all the buffers.
    - `Enter` paste selected buffer.
    - `p` paste selected buffer, same as `Enter`.
    - `d` delete selected buffer.
    - `t` tag an element.
    - `P` (capital) paste tagged buffers.
    - `D` (capital) delete selected buffer.


