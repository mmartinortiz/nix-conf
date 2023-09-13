{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    options = {
      number = true;
    };

    colorschemes = {
      gruvbox.enable = true;
    };

    plugins = {
      lightline.enable = true;
      nix.enable = true;
      treesitter.enable = true;
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        extensions.fzf-native.fuzzy = true;
      };
      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };
      neo-tree.enable = true;
      bufferline.enable = true;
      indent-blankline.enable = true;
      # lualine = {
      #   enable = true;
      #   theme = "gruvbox-material";
      # };
      commentary.enable = true;
      lsp = {
        enable = true;
        servers = {
          # More servers are
          # https://nix-community.github.io/nixvim/plugins/lsp/servers
          nil_ls.enable = true;
          jsonls.enable = true;
          # pyright.enable = true;
          ruff-lsp.enable = true;
          yamlls.enable = true;
        };
      };
      luasnip.enable = true;
      # nvim-cmp = {
      #   enable = true;
      #   autoEnableSources = true;
      #   sources = [{ name = "nvim_lsp"; }];
      #   snippet.expand = "luasnip";
      #   mappingPresets = [ "insert" ];
      #   mapping = {
      #     "<CR>" = "cmp.mapping.confirm({ select = true })";
      #   };
      # };
    };
  };
}
