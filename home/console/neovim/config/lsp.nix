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
      sources = [
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "buffer";}
        {name = "nvim_lua";}
        {name = "path";}
      ];
      snippet.expand = "luasnip";
      mappingPresets = ["insert"];
      mapping = {
        # `Enter` key to confirm completion
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        # Ctrl+Space to trigger completion menu
        "<C-Space>" = "cmp.mapping.complete()";
        # Navigate between snippet placeholder
        "<C-j>" = "\n                cmp.mapping(function(fallback)\n                  if cmp.visible() then\n                          cmp.select_next_item()\n                  elseif vim.fn['vsnip#available'](1) == 1 then\n                          feedkey('<Plug>(vsnip-expand-or-jump)', '')\n                  elseif has_words_before() then\n                          cmp.complete()\n                  else\n                          fallback()\n                  end\n                end, {\n                  'i',\n                  's',\n                })";

        "<C-k>" = "\n                cmp.mapping(function()\n                  if cmp.visible() then\n                          cmp.select_prev_item()\n                  elseif vim.fn['vsnip#jumpable'](-1) == 1 then\n                          feedkey('<Plug>(vsnip-jump-prev)', '')\n                  end\n                end, {\n                  'i',\n                  's',\n                })";
      };
    };
    plugins = {
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
    };
  };
}
