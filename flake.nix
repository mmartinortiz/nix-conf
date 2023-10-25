{
  description = "My Home Manager flake";

  inputs = {
    # systems.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    flake-utils,
    home-manager,
    nixvim,
    ...
  } @ inputs: let
    mkHomeConfig = machineModule: system: home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
      };

      modules = [
        nixvim.homeManagerModules.nixvim
        # ./common
        ./home/default.nix
        machineModule
      ];

      extraSpecialArgs = {
        inherit inputs system;
      };
    };

  in {
homeConfigurations."manolo@laptop" = mkHomeConfig ./machines/laptop.nix "x86_64-linux";
homeConfigurations."manolo@desktop" = mkHomeConfig ./machines/desktop.nix "x86_64-linux";
  };
  #   system = "x86_64-linux";
  #   pkgs = nixpkgs.legacyPackages.${system};
  # in {
  #   homeConfigurations = {
  #     manolo = home-manager.lib.homeManagerConfiguration {
  #       inherit pkgs;
  #       modules = [
  #         nixvim.homeManagerModules.nixvim
  #         ./home/default.nix
  #       ];
  #     };
  #   };
  # };
}
