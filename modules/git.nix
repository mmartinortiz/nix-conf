{...}: {
  programs.git = {
    enable = true;
    lfs.enable = false;

    difftastic = {
      enable = true;
      display = "side-by-side";
    };

    delta = {
      enable = false;
      options = {side-by-side = true;};
    };

    userName = "manolo";
    userEmail = "mmartinortiz@gmail.com";

    extraConfig = {
      branch = {sort = "-committerdate";};
      core = {editor = "vim";};
      diff = {algorithm = "histogram";};
      fetch = {prune = true;};
      init = {defaultBranch = "main";};
      log = {date = "iso";};
      push = {
        autoSetupRemote = true;
        default = "current";
      };
    };
  };
}
