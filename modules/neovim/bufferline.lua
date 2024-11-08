require('bufferline').setup({})

-- Buffer list navigation
vim.keymap.set('n', '<S-TAB>', vim.cmd.bprevious, { silent = true, desc = 'previous buffer' })
vim.keymap.set('n', '<TAB>', vim.cmd.bnext, { silent = true, desc = 'next buffer' })
