{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      coc-json
      coc-nvim
      coc-prettier
      coc-pyright
      coc-vimlsp
      coc-yaml

      catppuccin-nvim # https://github.com/catppuccin
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp-spell
      cmp-treesitter
      cmp-fish
      cmp-vsnip
      gitsigns-nvim
      lightline-vim
      lspkind-nvim
      null-ls-nvim
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-tree-lua
      nvim-ts-rainbow
      (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
      telescope-fzy-native-nvim
      telescope-nvim
      vim-floaterm
      vim-sneak
      vim-vsnip
      which-key-nvim # https://github.com/folke/which-key.nvim
    ];

    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        black
        isort
        ruff
        ruff-lsp
      ]))
    ];

    coc.settings = {
      "codeLens.enable" = true;
      "codeLens.separator" = "‣";

      "diagnostic.displayByAle" = true;
      "diagnostic.virtualText" = true;
      "diagnostic.virtualTextPrefix" = "  ~> ";

      "highlight.colorNames.enable" = false;

      "python.formatting.provider" = "black";
      "python.linting.ruffEnabled" = true;
      "python.pythonPath" = "nvim-python3";

      "rust-analyzer.inlayHints.closureReturnTypeHints.enable" = true;
      "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      "rust-analyzer.updates.checkOnStartup" = false;

      "suggest.enablePreselect" = true;
      "suggest.enablePreview" = true;
      "texlab.path" = "${pkgs.texlab}/bin/texlab";
      languageserver = {
        nix = {
          "command" = "rnix-lsp";
          "filetypes" = [ "nix" ];
        };
      };
    };

    extraConfig =
      let
        luaRequire = module:
          builtins.readFile (builtins.toString
            ./config
          + "/${module}.lua");
        luaConfig = builtins.concatStringsSep "\n" (map luaRequire [
          "init"
          "lspconfig"
          "nvim-cmp"
          "theming"
          "treesitter"
          "treesitter-textobjects"
          "utils"
          "which-key"
        ]);
      in
      ''
        lua << 
        ${luaConfig}
        
      '';
  };
}
