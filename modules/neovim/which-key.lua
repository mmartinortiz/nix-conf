local wk = require('which-key')
wk.setup {win = {border = 'single'}}
wk.add({
    -- File Group
    { "<leader>f", group = "File"},
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                            desc = "Find file"},
    { "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find file, including ignored" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                              desc = "Open Recent file"},
    { "<leader>fn", "<cmd>enew<cr>",                                                      desc = "New file"},
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",                             desc = "Grep files"},
    { "<leader>fH", "<cmd>Telescope live_grep hidden=true no_ignore=true<cr>",  desc = "Grep files, including ignored"},
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                               desc = "Grep buffers"},
    { "<leader>ft", "<cmd>Telescope help_tags<cr>",                             desc = "Grep Help Tags"},
    { "<leader>fc", "<cmd>bd<cr>",                                                   desc = "Close current buffer"},

    -- Goto group
    {"<leader>g", group = "Goto"},
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
    { "<leader>gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Goto References" },
    { "<leader>gi", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Hove Diagnostics" },
    { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hove Symbol Details" },

    -- Miscelanea
    {"<leader>m", group = "Misc"},
    { "<leader>mc", "<cmd>Telescope commands<cr>", desc = "List available NeoVim commands" }
})
