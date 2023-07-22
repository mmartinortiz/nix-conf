{
  description = "My Home Manager flake";

  inputs =
    {
      # systems.url = "github:nix-systems/x86_64-linux";
      nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
      flake-utils = {
        url = "github:numtide/flake-utils";
        # inputs.systems.follows = "systems";
      };
      home-manager =
        {
          url = "github:nix-community/home-manager/release-23.05";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs =
    { nixpkgs
    , flake-utils
    , home-manager
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations = {
        manolo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
