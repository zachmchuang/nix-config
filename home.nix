{ config, pkgs, inputs, ...}:

{
	imports = [
		./modules/home-manager
	];

	home.packages = with pkgs; [
		inputs.eric-config.packages.${pkgs.system}.nvim
	];

	home.username = "zach";
	home.homeDirectory = "/home/zach";
	home.stateVersion = "26.05";
}
