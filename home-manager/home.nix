{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself:
  programs = {
    home-manager.enable = true;
  };
  home = {
    # Home Manager needs a bit of information about you and the paths it should manage:
    username = "<username>";
    homeDirectory = "/home/<username>";
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
      dua
      duf
      du-dust
      neofetch
      nixpkgs-fmt
      vim
    ];

    sessionVariables = {
      EDITOR = "vim";
      SYSTEMD_EDITOR = "vim";
      VISUAL = "vim";
    };
  };
}
