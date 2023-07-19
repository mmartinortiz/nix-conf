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
    git = {
      enable = true;
      userName = "manolo";
      userEmail = "mmartinortiz@gmail.com";
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
      grc
      neofetch
      nixpkgs-fmt
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
