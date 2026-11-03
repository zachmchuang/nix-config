{ config, pkgs, ...}:

{
	imports = [
		./modules/home-manager
	];

	home.username = "zach";
	home.homeDirectory = "/home/zach";

	home.packages = with pkgs; [ ];

	home.stateVersion = "26.05";
}
