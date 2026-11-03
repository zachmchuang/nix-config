{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/home-manager
  ];

  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    inputs.eric-config.packages.${pkgs.system}.nvim
  ];

  git.enable = true;
  kitty.enable = true;
  lazygit.enable = true;
  niri.enable = true;
  tmux.enable = true;
  theme.enable = true;
}
