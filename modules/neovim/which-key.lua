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
    { "<leader>ff", "<cmd>Telescope find_files<cr>",               desc = "Find file" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                 desc = "Open Recent file" },
    { "<leader>fn", "enew",                                        desc = "New file" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>",                desc = "Grep files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                  desc = "Grep buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",                desc = "Grep Help Tags" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",              desc = "Grep Diagnostics" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",                desc = "Grep Git Files" },

    -- Goto group
    { "<leader>g",  group = "Goto" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>",          desc = "Goto Definition" },
    { "<leader>gI", "<cmd>Telescope lsp_implementations<cr>",      desc = "Goto Implementation" },
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>",           desc = "Goto References" },
    { "<leader>gi", "<cmd>lua vim.diagnostic.open_float()<cr>",    desc = "Hove Diagnostics" },
    { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<cr>",            desc = "Hove Symbol Details" },

  -- }
}
)
