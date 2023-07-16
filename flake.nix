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
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeManagerConfigurations = {
        <username> = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          imports = [
            ./home-manager/home.nix
          ];
        };
      };
    });
}
