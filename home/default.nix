{pkgs, ...}: let
  my-packages = with pkgs; [
    alejandra # Format Nix files
    chafa # Terminal image viewer
    deadnix
    devbox # Create isolated shells for development
    devcontainer
    diffr # Modern Unix `diff`
    du-dust
    dua # Modern Unix `du`
    duf # Modern Unix `df`
    fd # Modern Unix `find`
    glow # Terminal Markdown renderer
    gping # Modern Unix `ping`
    grc # Colour terminal output
    nvim-pkg
    # pipx # Install and run Python applications in isolated environments
    pre-commit # A framework for managing and maintaining multi-language pre-commit hooks
    procs # Modern Unix `ps`
    python312Packages.ipython # IPython: Productive Interactive Computing
    python312Packages.bpython # A fancy curses interface to the Python interactive interpreter
    ripgrep # Modern Unix `grep`
    tldr # Modern Unix `man`
    uv # Replacement for pip written in Rust
    wget2
    (pkgs.nerdfonts.override {fonts = ["Hack" "UbuntuMono" "FiraCode"];})
  ];
in {
  home = {
    username = "manolo";
    homeDirectory = "/home/manolo";
    stateVersion = "24.05";

    packages = my-packages;

    # Alternative:
    # packages =
    #   my-packages
    #   ++ stable-packages
    #   ++
    #   [
    #     pkgs.some-package
    #     pkgs.another-package
    #   ];

    sessionVariables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  imports = [
    ./console/bat.nix
    ./console/bottom.nix
    ./console/direnv.nix
    ./console/eza.nix
    ./console/fish
    ./console/git.nix
    ./console/lazygit.nix
    ./console/micro.nix
    ./console/tmux.nix
    ./console/poetry.nix
  ];

  programs = {home-manager.enable = true;};

  fonts.fontconfig.enable = true;
}
