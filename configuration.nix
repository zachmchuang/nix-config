{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.systemd-boot.configurationLimit = 30;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    # os-prober mislabels Arch and points it at NixOS kernels on the shared ESP
    useOSProber = false;

    theme = pkgs.sleek-grub-theme.override {
      withStyle = "dark";
      withBanner = "Welcome, Zach";
    };

    # From Arch's leftover systemd-boot entry on the shared ESP
    extraEntries = ''
      menuentry "Arch Linux" --class arch {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root EC41-E5FD
        linux /vmlinuz-linux root=PARTUUID=78b0d380-b2b4-41d5-b1b3-0256328000c3 zswap.enabled=0 rw rootfstype=ext4
        initrd /intel-ucode.img /initramfs-linux.img
      }
    '';
  };

  boot.kernelParams = ["quiet"];
  boot.loader.timeout = null; # wait forever at boot menu
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zach-nix";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  time.timeZone = "America/Montreal";

  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.zach = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    home = "/home/zach";
  };

  programs.firefox.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    noctalia
    wget
    waybar
    swaylock
    mako
    brightnessctl
    vim
    signal-desktop
    slack
    nautilus
    btop
    tree

    xwayland-satellite
    xdg-desktop-portal-gnome
    kdePackages.polkit-kde-agent-1
    gnome-keyring
  ];

  services.openssh.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  greetd.enable = true;

  # DO NOT CHANGE
  system.stateVersion = "26.05"; # Did you read the comment?
}
