{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself:
  programs = {
    home-manager.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
      icons = true;
    };
    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };

  };
  imports = [
    # Example of application configuration.
    # Note that 'micro' does not need to be indicated bellow, under the packages section
    ./apps/fish.nix
    ./apps/micro.nix
    ./apps/vim.nix
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
      alejandra
      chafa
      deadnix
      du-dust
      dua
      duf
      neofetch
      nixpkgs-fmt
      wget2
    ];

    sessionVariables = {
      EDITOR = "vim";
      SYSTEMD_EDITOR = "vim";
      VISUAL = "vim";
    };

    fonts = {
      fontDir.enable = true;
      fonts = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro" "UbuntuMono" ]; })
        fira
        fira-go
        joypixels
        liberation_ttf
        noto-fonts-emoji
        source-serif
        ubuntu_font_family
        work-sans
      ];

      # Enable a basic set of fonts providing several font styles and families and reasonable coverage of Unicode.
      enableDefaultFonts = false;

      fontconfig = {
        antialias = true;
        defaultFonts = {
          serif = [ "Source Serif" ];
          sansSerif = [ "Work Sans" "Fira Sans" "FiraGO" ];
          monospace = [ "FiraCode Nerd Font Mono" "SauceCodePro Nerd Font Mono" ];
          emoji = [ "Joypixels" "Noto Color Emoji" ];
        };
        enable = true;
        hinting = {
          autohint = false;
          enable = true;
          style = "hintslight";
        };
        subpixel = {
          rgba = "rgb";
          lcdfilter = "light";
        };
      };
    };
  };
}
