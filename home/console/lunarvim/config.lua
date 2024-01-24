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

-- Soft wrap of Markfown files
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

-- Autocmd commands
-- -- Persistent Folds
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})
-- Persistent Cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Cursor Line on each window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
