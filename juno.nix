{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "manolo";
  home.homeDirectory = "/home/manolo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./common.nix
  ];
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
  };

  # Laptop specific configuration
  programs.fish = {
    interactiveShellInit = ''
      fish_add_path ~/bin
    '';
    shellAbbrs = {
      nu =
        pkgs.lib.mkForce
        "nix flake update && nix run nixpkgs#home-manager -- switch && nix-store --gc";
    };
  };
}
