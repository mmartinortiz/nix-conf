require("which-key").setup {}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.autoindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
vim.opt.history = 2000
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.lazyredraw = false
vim.opt.nrformats = 'bin,hex' -- 'octal'
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.shiftwidth = 2
vim.opt.showmatch = true -- Highlight matching parentheses, etc
vim.opt.softtabstop = 2
vim.opt.spell = true
vim.opt.spelllang = 'en'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.compatible = false


-- Search down into subfolders
vim.opt.path = vim.o.path .. '**'

-- syntax on
-- filetype plugin on
-- filetype plugin indent on


-- opt.statusline=
-- opt.statusline +=%1*\ %n\ %*            "buffer number
-- set statusline +=%1*%{&ff}%*            "file format
-- set statusline +=%1*%y%*                "file type
-- set statusline +=%1*\ %<%F%*            "full path
-- set statusline +=%1*%m%*                "modified flag
-- set statusline +=%1*%=%5l%*             "current line
-- set statusline +=%1*/%L%*               "total lines
-- set statusline +=%1*%4v\ %*             "virtual column number
-- set statusline +=%1*0x%04B\ %*          "character under cursor

local wk = require('which-key')

wk.setup {
    win = {
        border = 'single',
    },
}
wk.add({
    -- add = {
    -- File Group
    { "<leader>f",  group = "File" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find file" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",              desc = "Open Recent file" },
    { "<leader>fn", "enew",                                     desc = "New file" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>",             desc = "Grep files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",               desc = "Grep buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",             desc = "Grep Help Tags" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",           desc = "Grep Diagnostics" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",             desc = "Grep Git Files" },

    -- Goto group
    { "<leader>g",  group = "Goto" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>",       desc = "Goto Definition" },
    { "<leader>gI", "<cmd>Telescope lsp_implementations<cr>",   desc = "Goto Implementation" },
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>",        desc = "Goto References" },
    { "<leader>gi", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Hove Diagnostics" },
    { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<cr>",         desc = "Hove Symbol Details" },

    -- }
}
)

require('Comment').setup({
  ---Add a space b/w comment and the line
  ---@type boolean
  padding = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|function
  ignore = nil,

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  ---@type table
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---extra mapping
    ---Includes `gco`, `gcO`, `gcA`
    extra = true,
    ---extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = false,
  },

  ---LHS of toggle mapping in NORMAL + VISUAL mode
  ---@type table
  toggler = {
    ---line-comment keymap
    -- line = 'gcc',
    line = '<leader>/',
    ---block-comment keymap
    block = 'gbc',
    -- block = '<leader>/',
  },

  ---LHS of operator-pending mapping in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---line-comment keymap
    -- line = 'gc',
    line = '<leader>/',
    ---block-comment keymap
    block = 'gb',
  },

})
