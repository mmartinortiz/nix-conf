{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      # See https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
      git = {paging = {useConfig = true;};};
    };
  };
}
