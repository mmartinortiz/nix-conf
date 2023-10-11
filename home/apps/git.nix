{ ... }: {
  programs.git = {
    enable = true;
    lfs.enable = false;
    diff-so-fancy.enable = true;
    userName = "manolo";
    userEmail = "mmartinortiz@gmail.com";
  };
}
