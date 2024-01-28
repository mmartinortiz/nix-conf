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

- `C-g` enters the **copy mode**. `vi` movements apply.

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

## NeoVim

Keyboard mappings. More about notations, [here](https://neovim.io/doc/user/intro.html#key-notation)

By default, the leader key is `\`.

### Language Server Protocol

- `<leader>k`: Go to next warning/error.
- `<leader>j`: Go to previous warning/error.
- `<leader>ld`: Go to definition.
- `<leader>lr`: Go to references.
- `<leader>rt`: Go to type definition.
- `<leader>ri`: Go to implementation.
- `<leader>lrn`: Rename.
- `<leader>F`: Format file.
- `<leader>e`: Show hover information.

### ToggleTerm - Normal mode

Remember, `t` for *t*erminal.

- `<leader>tf`: Floating terminal.
- `<ledaer>th`: Horizontal terminal.
- `<leader>tv`: Vertical terminal.
- `<C-\>`: Toggle terminal (default direction).

### Comments - Normal and Visual Mode

- `<C-/>`: Toggle comments.

### Completion - Insert Mode

- `<C-Space>`: Trigger completion.
- `<CR>`: Accept completion.
- `<C-j>`: Move up on completion list.
- `<C-k>`: Move down on completion list.

### Telescope

Remember, `f` for *f*ind.

- `<leader>ff`: Telescope find_files.
- `<leader>fg`: Telescope live_grep.
- `<leader>fb`: Telescope buffers.
- `<leader>fh`: Telescope help_tags.
- `<leader>fk`: Telescope keymaps.
- `<leader>fp`: Telescope commands.

More on [telescope's documentation](https://github.com/nvim-telescope/telescope.nvim#default-mappings).

### Barbar

Remember, the `meta` or `m` key is `alt` by default.

Reordering tabs

- `<m-s-k>`: Move tab to right.
- `<m-s-j>`: Move tab to left.
- `<m-p>`: Pin tab.

Navigating tabs

- `<m-k>`: Move to next tab.
- `<m-j>`: Move to previous tab.

Close tab

- `<m-x>`: Close tab

## Lunarvim

[Keybindings](https://www.lunarvim.org/docs/configuration/keybindings)

## Byobu

Byobu is a suite of enhancements to tmux, as a command line
tool providing live system status, dynamic window management,
and some convenient keybindings:

- `F1` _ Used by X11 _
  - `Shift-F1` Display this help
  - `F2` Create a new window
- `Shift-F2` Create a horizontal split
  - `Ctrl-F2` Create a vertical split
  - `Ctrl-Shift-F2` Create a new session
- `F3/F4` Move focus among windows
  - `Alt-Left/Right` Move focus among windows
  - `Alt-Up/Down` Move focus among sessions
  - `Shift-Left/Right/Up/Down` Move focus among splits
  - `Shift-F3/F4` Move focus among splits
  - `Ctrl-F3/F4` Move a split
  - `Ctrl-Shift-F3/F4` Move a window
  - `Shift-Alt-Left/Right/Up/Down` Resize a split
- `F5` Reload profile, refresh status
  - `Alt-F5` Toggle UTF-8 support, refresh status
  - `Shift-F5` Toggle through status lines
  - `Ctrl-F5` Reconnect ssh/gpg/dbus sockets
  - `Ctrl-Shift-F5` Change status bar's color randomly
- `F6` Detach session and then logout
  - `Shift-F6` Detach session and do not logout
  - `Alt-F6` Detach all clients but yourself
  - `Ctrl-F6` Kill split in focus
- `F7` Enter scrollback history
  - `Alt-PageUp/PageDown` Enter and move through scrollback
  - `Shift-F7` Save history to $BYOBU_RUN_DIR/printscreen
- `F8` Rename the current window
  - `Ctrl-F8` Rename the current session
  - `Shift-F8` Toggle through split arrangements
  - `Alt-Shift-F8` Restore a split-pane layout
  - `Ctrl-Shift-F8` Save the current split-pane layout
- `F9` Launch byobu-config window
  - `Ctrl-F9` Enter command and run in all windows
  - `Shift-F9` Enter command and run in all splits
  - `Alt-F9` Toggle sending keyboard input to all splits
- `F10` _ Used by X11 _
- `F11` _ Used by X11 _
  - `Alt-F11` Expand split to a full window
  - `Shift-F11` Zoom into a split, zoom out of a split
  - `Ctrl-F11` Join window into a vertical split
- `F12` Escape sequence
  - `Shift-F12` Toggle on/off Byobu's keybindings
  - `Alt-F12` Toggle on/off Byobu's mouse support
  - `Ctrl-Shift-F12` Mondrian squares

10 min video tutorial:
https://www.youtube.com/watch?v=NawuGmcvKus
