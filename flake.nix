{
  description = "My Home Manager flake";

  inputs = {
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
      default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            nixpkgs.overlays = [
              kickstart-nix-nvim.overlays.default
            ];
          }
          ./home/default.nix
        ];
      };
    };
  };
}
