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
      options = {
        side-by-side = true;
      };
    };

    userName = "manolo";
    userEmail = "mmartinortiz@gmail.com";

    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      diff = {
        algorithm = "histogram";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
