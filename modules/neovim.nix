{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.readFile ./neovim/init.lua;

    plugins = with pkgs.vimPlugins; [
      mini-nvim
      nvim-web-devicons
      telescope-nvim
      which-key-nvim
      comment-nvim
    ];
  };
}
