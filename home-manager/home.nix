{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself:
  programs = {
    home-manager.enable = true;
    eza = {
      enable = true;
      icons = true;
      git = true;
      extraOptions = [
        "--hyperlink"
        "--group-directories-first"
        "--header"
      ];
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };
    git = {
      enable = true;
      userName = "manolo";
      userEmail = "mmartinortiz@gmail.com";
    };
    direnv = {
      # Note, enabling the direnv module will always active its functionality for Fish
      # since the direnv package automatically gets loaded in Fish
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
  imports = [
    # Example of application configuration.
    # Note that 'micro' does not need to be indicated bellow, under the packages section
    ./apps/fish.nix
    ./apps/micro.nix
    ./apps/vim.nix
    ./editors/neovim
  ];
  home = {
    # Home Manager needs a bit of information about you and the paths it should manage:
    username = "manolo";
    homeDirectory = "/home/manolo";
    # This value determines the Home Manager release that your configuration is compatible with.
    # This helps avoid breakage when a new Home Manager release introduces backwards incompatible changes.
    #
    # You can update Home Manager without changing this value.
    # See the Home Manager release notes for a list of state version changes in each release.
    stateVersion = "23.05";
    packages = with pkgs; [
      chafa # Terminal image viewer
      deadnix
      diffr # Modern Unix `diff`
      du-dust
      dua # Modern Unix `du`
      duf # Modern Unix `df`
      fd # Modern Unix `find`
      glow # Terminal Markdown renderer
      gping # Modern Unix `ping`
      grc # Colour terminal output
      nixpkgs-fmt
      procs # Modern Unix `ps`
      ripgrep # Modern Unix `grep`
      tldr # Modern Unix `man`
      wget2
      (pkgs.nerdfonts.override { fonts = [ "Hack" "UbuntuMono" "FiraCode" ]; })
    ];

    sessionVariables = {
      EDITOR = "vim";
      SYSTEMD_EDITOR = "vim";
      VISUAL = "vim";
    };

  };
  fonts.fontconfig.enable = true;
}
