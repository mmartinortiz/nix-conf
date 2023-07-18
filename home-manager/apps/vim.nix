{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      commentary
      gitgutter
      surround
      The_NERD_tree
      vim-fish
    ];
    extraConfig = builtins.readFile apps/vimrc;
  };
}
