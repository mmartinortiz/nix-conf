{...}: {
  home = {
    username = "manolo";
    homeDirectory = "/home/manolo";
    stateVersion = "23.05";

    sessionVariables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  imports = [
    ./console/packages.nix
    ./console/bat.nix
    ./console/direnv.nix
    ./console/eza.nix
    ./console/fish
    ./console/git.nix
    ./console/lazygit.nix
    ./console/micro.nix
    ./console/neovim
    ./console/tmux.nix
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      lfs.enable = false;
      diff-so-fancy.enable = true;
      userName = "manolo";
      userEmail = "mmartinortiz@gmail.com";
    };
  };

  fonts.fontconfig.enable = true;
}
