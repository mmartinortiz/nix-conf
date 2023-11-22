{...}: {
  programs.git = {
    enable = true;
    lfs.enable = false;

    delta = {
      enable = true;
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
    };
  };
}
