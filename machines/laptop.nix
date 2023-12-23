{pkgs, ...}: {
  # Laptop specific configuration
  programs.fish = {
    interactiveShellInit = ''
      fish_add_path ~/bin
    '';
    shellAbbrs = {
      nr = pkgs.lib.mkForce "nix run nixpkgs#home-manager -- switch --flake .#laptop";
    };
  };
  home.packages = with pkgs; [
    fortune
  ];
}
