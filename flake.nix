{
	description = "nix config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.zach-nix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ 
				./configuration.nix 
				./modules/nixos
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.zach = import ./home.nix;
				}
			];
		};
	};
}
