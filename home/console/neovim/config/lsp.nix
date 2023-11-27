# Language Server Protocol
{...}: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        # More servers at
        # https://nix-community.github.io/nixvim/plugins/lsp/servers
        nil_ls.enable = true;
        jsonls.enable = true;
        pyright.enable = true;
        ruff-lsp.enable = true;
        taplo.enable = true;
        yamlls.enable = true;
      };
      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics
          "<leader>k" = {
            action = "goto_prev";
            desc = "Go to previous warning/error";
          };
          "<leader>j" = {
            action = "goto_next";
            desc = "Go to next warning/error";
          };
        };

        lspBuf = {
          "<leader>ld" = {
            action = "definition";
            desc = "Go to definition";
          };
          "<leader>lr" = {
            action = "references";
            desc = "Go to references";
          };
          "<leader>rt" = {
            action = "type_definition";
            desc = "Go to type definition";
          };
          "<leader>ri" = {
            action = "implementation";
            desc = "Go to implementation";
          };
          "<leader>e" = {
            action = "hover";
            desc = "Show hover information";
          };
          "<leader>lrn" = {
            action = "rename";
            desc = "Rename object";
          };
          "<leader>F" = {
            action = "format";
            desc = "Format file";
          };
        };
      };
    };
    plugins.none-ls = {
      enable = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          black.enable = true;
          isort.enable = true;
          markdownlint.enable = true;
          prettier.enable = true;
          rustfmt.enable = true;
          shfmt.enable = true;
          taplo.enable = true;
        };
      };
    };

    plugins.treesitter.enable = true;

    plugins.lsp-format.enable = true;

    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [{name = "nvim_lsp";}];
      snippet.expand = "luasnip";
      mappingPresets = ["insert"];
      mapping = {
        # `Enter` key to confirm completion
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        # Ctrl+Space to trigger completion menu
        "<C-Space>" = "cmp.mapping.complete()";
        # Navigate between snippet placeholder
        "<C-j>" = "
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                          cmp.select_next_item()
                  elseif vim.fn['vsnip#available'](1) == 1 then
                          feedkey('<Plug>(vsnip-expand-or-jump)', '')
                  elseif has_words_before() then
                          cmp.complete()
                  else
                          fallback()
                  end
                end, {
                  'i',
                  's',
                })";

        "<C-k>" = "
                cmp.mapping(function()
                  if cmp.visible() then
                          cmp.select_prev_item()
                  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                          feedkey('<Plug>(vsnip-jump-prev)', '')
                  end
                end, {
                  'i',
                  's',
                })";
      };
    };
  };
}
