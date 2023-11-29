{pkgs, ...}: {
  # Laptop specific configuration
  programs.fish = {
    shellAbbrs = {
      nr = pkgs.lib.mkForce "nix run nixpkgs#home-manager -- switch --flake .#laptop";
    };
  };
  home.packages = with pkgs; [
    fortune
  ];
}
