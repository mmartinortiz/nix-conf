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
