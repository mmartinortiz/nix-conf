{
  description = "My Home Manager flake";

  inputs = {
    systems.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , home-manager
    , ...
    }:
    let
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Devshell for bootstrapping; acessible via 'nix develop' or 'nix-shell' (legacy)
      devShells = flake-utils.lib.eachDefaultSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      homeConfigurations = {
        manolo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
        };
      };

      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = flake-utils.lib.eachDefaultSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./nixpkgs.nix { inherit pkgs; }
      );
    };
}
