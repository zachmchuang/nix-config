
{ config, lib, pkgs, ... }:

{
	imports =
		[
		./hardware-configuration.nix
		./modules/keyd.nix
		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.timeout = null; # wait forever at boot menu
	boot.loader.systemd-boot.configurationLimit = 5;

networking.hostName = "zach-nix"; # Define your hostname.

	networking.networkmanager.enable = true;
	hardware.bluetooth.enable = true;
	services.power-profiles-daemon.enable = true;
	services.upower.enable = true;

time.timeZone = "America/Montreal";

i18n.defaultLocale = "en_US.UTF-8";
# console = {
#   font = "Lat2-Terminus16";
#   keyMap = "us";
#   useXkbConfig = true; # use xkb.options in tty.
# };

# Enable CUPS to print documents.
# services.printing.enable = true;

services.pipewire = {
  enable = true;
  pulse.enable = true;
};

services.libinput.enable = true;

	users.users.zach = {
		isNormalUser = true;
		extraGroups = [ "wheel"];
			shell = pkgs.bash;
		home = "/home/zach";
		packages = with pkgs; [
			tree
		];
	};

	programs.firefox.enable = true;
	programs.niri.enable = true;

nixpkgs.config.allowUnfree = true;
# You can use https://search.nixos.org/ to find more packages (and options).
	environment.systemPackages = with pkgs; [
	git
		noctalia
		vim
		wget
		kitty
		fuzzel
		waybar
		swaylock
		mako
		brightnessctl
		neovim
		signal-desktop
		slack
		nautilus

		# Wayland stuff
		xwayland-satellite
		xdg-desktop-portal-gnome
		kdePackages.polkit-kde-agent-1
		gnome-keyring
	];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

	services.openssh.enable = true;
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
				user = "zach";
			};
		};
	};

	security.polkit.enable = true;
	services.gnome.gnome-keyring.enable = true;

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# DO NOT CHANGE
	system.stateVersion = "26.05"; # Did you read the comment?
}

