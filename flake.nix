{
  description = "My Home Manager flake";

  inputs = {
    # systems.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # TODO: Check https://github.com/LGUG2Z/nixos-wsl-starter/blob/master/flake.nix
    # for installing packages both from stable an unstable.
    # Requires an overlay
    flake-utils = {
      url = "github:numtide/flake-utils";
      # inputs.systems.follows = "systems";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nixvim.homeManagerModules.nixvim
          ./home/default.nix
          ./machines/laptop.nix
        ];
      };
      server = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nixvim.homeManagerModules.nixvim
          ./home/default.nix
          ./machines/server.nix
        ];
      };
    };
  };
}
