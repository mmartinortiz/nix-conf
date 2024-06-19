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
    kickstart-nix-nvim = {
      url = "github:mmartinortiz/neovim-conf";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    kickstart-nix-nvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            nixpkgs.overlays = [
              kickstart-nix-nvim.overlays.default
            ];
          }
          ./home/default.nix
          ./machines/laptop.nix
        ];
      };
      server = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            nixpkgs.overlays = [
              kickstart-nix-nvim.overlays.default
            ];
          }
          ./home/default.nix
          ./machines/server.nix
        ];
      };
    };
  };
}
