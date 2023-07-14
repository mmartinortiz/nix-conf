{
	description = "My Home Manager flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
		flake-utils.url = "github:numtide/flake-utils";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs: {

		homeConfigurations = {
			homeDirectory = "/home/manolo";
			username = "manolo";
			configuration.imports = [ ./home.nix ];
			stateVersion = "23.05";

		};

	};
};


