{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/home-manager
    inputs.nix-index-database.homeModules.default
  ];

  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    inputs.eric-config.packages.${pkgs.system}.nvim
  ];

  programs.fastfetch.enable = true;
  programs.nix-index-database.comma.enable = true;

  git.enable = true;
  kitty.enable = true;
  lazygit.enable = true;
  niri.enable = true;
  tmux.enable = true;
  theme.enable = true;
  kicad.enable = true;
  code-cursor.enable = true;
  gh.enable = true;
  java.enable = true;
  zsh.enable = true;
}
