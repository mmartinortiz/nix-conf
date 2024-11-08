{pkgs, ...}: {
  # Server specific configuration
  programs = {
    starship = {
      enable = true;
      settings = {
        # https://starship.rs/config/#prompt
      };
    };

    fish = {
      shellAbbrs = {
        nr =
          pkgs.lib.mkForce
          "nix run nixpkgs#home-manager -- switch --flake .#server";
        nu =
          pkgs.lib.mkForce
          "nix flake update && nix run nixpkgs#home-manager -- switch --flake .#server && nix-store --gc";
      };
    };
  };
}
