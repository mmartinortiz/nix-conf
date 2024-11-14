{
  pkgs,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.concatStringsSep "\n" [
      # Load Lua files
      "${lib.strings.fileContents ./neovim/init.lua}"
      "${lib.strings.fileContents ./neovim/autopairs.lua}"
      "${lib.strings.fileContents ./neovim/bufferline.lua}"
      "${lib.strings.fileContents ./neovim/gitsigns.lua}"
      "${lib.strings.fileContents ./neovim/noice.lua}"
      "${lib.strings.fileContents ./neovim/comment.lua}"
      "${lib.strings.fileContents ./neovim/treesitter.lua}"
      "${lib.strings.fileContents ./neovim/statuscol.lua}"
      "${lib.strings.fileContents ./neovim/which-key.lua}"
      "${lib.strings.fileContents ./neovim/tmux-navigator.lua}"
    ];

    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      comment-nvim
      gitsigns-nvim
      mini-nvim
      noice-nvim
      nui-nvim
      nvim-autopairs
      nvim-notify
      nvim-surround
      nvim-treesitter-context # nvim-treesitter-context
      nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      statuscol-nvim
      telescope-nvim
      vim-lastplace
      vim-tmux-navigator
      which-key-nvim
    ];
  };
}
