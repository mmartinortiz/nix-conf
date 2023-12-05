-- Comment
-- lvim.builtin.comment.keymap.visual_mode["<C-_>"] = "<Plug>(comment_toggle_linewise_visual)"
-- lvim.builtin.comment.keymap.normal_mode["<C-_>"] = "<Plug>(comment_toggle_linewise_current)"

-- lvim.keys.
lvim.builtin.bufferline.keymap.normal_mode["<m-j>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.bufferline.keymap.normal_mode["<m-k>"] = ":BufferLineCycleNext<CR>"

-- Close the current buffer tab
lvim.builtin.bufferline.keymap.normal_mode["<m-x>"] = ":bd<CR>"

-- lvim.lsp.buffer_mappings.normal_mode["<CR>"] = "cmp.mapping.confirm({ select = true})"

lvim.plugins = {
	"christoomey/vim-tmux-navigator"
}
