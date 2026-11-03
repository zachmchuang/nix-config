{
	description = "nix config"
	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	outputs = { self, nixpkgs }: {
		nixosConfigurations.zach-nix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./configuration.nix ];
		};
	};
}
