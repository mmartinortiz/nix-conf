# Cheatsheet

## tmux

### Panes & Windows

- Navigation
  - `C-b w` shows all windows and panes.
  - `C-b j|k` move to previous/next window.
  - `C h|j|k|l` moves between panes. Provided by [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).
  - `C-b <arrow key>` move between panes.
  - `C-b n` next window.
  - `C-b p` previous window.

- Resize panes
  - `C-b C-<arrow key>` resizes the pane in small steps.
  - `C-b z` maximazes the pane. Press it again to restore the size.
  - `C-b Space` iterates over layouts.

### Copy and Paste

[Official Tmux copy and paste documentation](https://github.com/tmux/tmux/wiki/Getting-Started#copy-and-paste).

- `C-b [` enters the **copy mode**. `vi` movements apply.

- Copy mode
  - `space` select text.
  - `y` copies selected text (and exists copy mode).
  - `Y` "put" selection. Equivalent to copying a selection, and pasting it to the command line.

- Normal mode
  - `C-b y` copies text from the comman line to the clipboard (?).
  - `C-b y` copy the current's pane working directory to the clipboard.
  - `C-b ]` paste current buffer.
  - `C-b =` shows a list of all the buffers.
    - `Enter` paste selected buffer.
    - `p` paste selected buffer, same as `Enter`.
    - `d` delete selected buffer.
    - `t` tag an element.
    - `P` (capital) paste tagged buffers.
    - `D` (capital) delete selected buffer.


