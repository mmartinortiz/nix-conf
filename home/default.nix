{pkgs, ...}: {
  # Let Home Manager install and manage itself:
  programs = {
    home-manager.enable = true;
  };
  imports = [
    # Example of application configuration.
    # Note that 'micro' does not need to be indicated bellow, under the packages section
    ./apps/bat.nix
    ./apps/direnv.nix
    ./apps/eza.nix
    ./apps/fish
    ./apps/git.nix
    ./apps/micro.nix
    ./apps/neovim
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
      alejandra # Format Nix files
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
      procs # Modern Unix `ps`
      ripgrep # Modern Unix `grep`
      tldr # Modern Unix `man`
      wget2
      (pkgs.nerdfonts.override {fonts = ["Hack" "UbuntuMono" "FiraCode"];})
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  fonts.fontconfig.enable = true;
}
