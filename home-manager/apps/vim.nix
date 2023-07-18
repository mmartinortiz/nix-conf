{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    vimPlugins = [
      pkgs.vimPlugins.vim-fish
      pkgs.vimPlugins.gitgutter
      pkgs.vimPlugins.commentary
      pkgs.vimPlugins.surround
    ];
    extraConfig = builtins.readFile vimrc;
  };
}
