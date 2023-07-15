{
	description = "My Home Manager flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
		flake-utils.url = "github:numtide/flake-utils";
		home-manager.url = "github:nix-community/home-manager/release-23.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

outputs = {
self, home-manager, nixpkgs, flake-utils,nixos-hardware, ...

} @inputs:
let
    inherit (self) outputs;
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.05";
    libx = import ./lib { inherit inputs outputs stateVersion; };
  in {
# Devshell for bootstrapping; acessible via 'nix develop' or 'nix-shell' (legacy)
    devShells = libx.forAllSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in import ./shell.nix { inherit pkgs; }
    );
};

}


