{pkgs, ...}: {
  imports = [
    ./config/keyboard_mapping.nix
    ./config/barbar.nix
    ./config/gitsigns.nix
    # ./config/telescope.nix
    # ./config/lsp.nix
  ];
  programs = {
    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      options = {
        number = true;
      };

      # extraPackages = [
      #   pkgs.pyright
      # ];

      colorschemes = {
        catppuccin = {
          enable = true;
          flavour = "mocha";
          transparentBackground = true;
          integrations = {
            barbar = true;
            gitsigns = true;
            telescope.enabled = true;
            which_key = true;
          };
        };
      };

      clipboard = {
        register = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xclip.enable = true;
        };
      };

      plugins = {
        # Comment visual blocks
        comment-nvim.enable = true;

        # Highligh current line
        cursorline = {
          enable = true;
          cursorline = {
            enable = true;
            timeout = 0;
            number = true;
          };
        };

        # indent-blankline.enable = true;

        # Go to the last place visited on a file
        lastplace.enable = true;

        # An status bar
        lualine = {
          enable = true;
          theme = "gruvbox-material";
        };

        luasnip.enable = true;

        # Nix plugin
        nix.enable = true;

        # Autopairs
        nvim-autopairs = {
          enable = true;
          checkTs = true;
        };

        # Toggle term
        # toggleterm = {
        #   enable = true;
        #   direction = "horizontal";
        # };

        tmux-navigator = {
          enable = true;
        };

        which-key = {
          enable = true;
        };
      };
    };
  };
}
