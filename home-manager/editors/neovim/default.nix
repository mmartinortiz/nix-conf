{ pkgs, ... }: {
  imports = [
    ./config/barbar.nix
    ./config/comment.nix
    ./config/gitsigns.nix
    ./config/telescope.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    options = {
      number = true;
    };

    extraPackages = [
      pkgs.pyright
    ];

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    maps = {
      normal = {
        "<leader>tf" = {
          action = "<cmd>ToggleTerm direction=float<cr>";
          silent = true;
          desc = "ToggleTerm float";
        };
        "<leader>th" = {
          action = "<cmd>ToggleTerm size=10 direction=horizontal<cr>";
          silent = true;
          desc = "ToggleTerm horizontal split";
        };
        "<leader>tv" = {
          action = "<cmd>ToggleTerm size=80 direction=vertical<cr>";
          silent = true;
          desc = "ToggleTerm vertical split";
        };
        "<c-\\>" = {
          action = "<cmd>ToggleTerm<cr>";
          silent = true;
          desc = "Toggle terminal";
        };
      };
    };

    plugins = {
      lastplace.enable = true;
      lightline.enable = true;
      nix.enable = true;
      treesitter.enable = true;
      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };
      toggleterm = {
        enable = true;
        direction = "horizontal";
      };
      neo-tree.enable = true;
      bufferline.enable = true;
      indent-blankline.enable = true;
      lualine = {
        enable = true;
        theme = "gruvbox-material";
      };
      commentary.enable = true;
      lsp = {
        enable = true;
        servers = {
          # More servers at
          # https://nix-community.github.io/nixvim/plugins/lsp/servers
          nil_ls.enable = true;
          jsonls.enable = true;
          pyright.enable = true;
          ruff-lsp.enable = true;
          yamlls.enable = true;
        };
      };
      luasnip.enable = true;
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [{ name = "nvim_lsp"; }];
        snippet.expand = "luasnip";
        mappingPresets = [ "insert" ];
        mapping = {
          # `Enter` key to confirm completion
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          # Ctrl+Space to trigger completion menu
          "<C-Space>" = "cmp.mapping.complete()";
          # Navigate between snippet placeholder
          "<Tab>" = "
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

          "<S-Tab>" = "
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
  };
}
