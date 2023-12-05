{pkgs, ...}: let
  my-packages = with pkgs; [
    alejandra # Format Nix files
    chafa # Terminal image viewer
    deadnix
    devbox # Create isolated shells for development
    diffr # Modern Unix `diff`
    du-dust
    dua # Modern Unix `du`
    duf # Modern Unix `df`
    fd # Modern Unix `find`
    glow # Terminal Markdown renderer
    gping # Modern Unix `ping`
    grc # Colour terminal output
    lunarvim
    procs # Modern Unix `ps`
    ripgrep # Modern Unix `grep`
    tldr # Modern Unix `man`
    wget2
    (pkgs.nerdfonts.override {fonts = ["Hack" "UbuntuMono" "FiraCode"];})
  ];
in {
  home = {
    username = "manolo";
    homeDirectory = "/home/manolo";
    stateVersion = "23.11";

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

    # FIXME: if you want to version your LunarVim config, add it to the root of this repo and uncomment the next line
    file.".config/lvim/config.lua".source = ./console/lunarvim/config.lua;

    sessionVariables = {
      EDITOR = "lvim";
      SYSTEMD_EDITOR = "lvim";
      VISUAL = "lvim";
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
    # ./console/neovim
    ./console/tmux.nix
  ];

  programs = {
    home-manager.enable = true;
  };

  fonts.fontconfig.enable = true;
}
