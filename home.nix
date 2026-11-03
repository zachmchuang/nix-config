{ config, pkgs, ...}:

{
	imports = [
		./modules/home-manager
	];

	home.username = "zach";
	home.homeDirectory = "/home/zach";
	home.stateVersion = "26.05";
}
